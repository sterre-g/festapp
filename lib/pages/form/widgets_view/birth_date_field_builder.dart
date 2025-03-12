import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fstapp/pages/form/models/birth_date_field_holder.dart';
import 'package:fstapp/themeConfig.dart';
import 'package:intl/intl.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fstapp/widgets/HtmlView.dart';

import 'form_field_builders.dart';
import 'form_helper.dart';
import '../models/form_holder.dart';

class BirthDateFieldBuilder extends StatefulWidget {
  final BirthDateFieldHolder fieldHolder;
  final DateTime? eventDate;
  final GlobalKey<FormBuilderState> formKey;
  /// Indicates whether the card design is used.
  final bool isCardDesign;

  const BirthDateFieldBuilder({
    Key? key,
    required this.fieldHolder,
    this.eventDate,
    required this.formKey,
    this.isCardDesign = false,
  }) : super(key: key);

  /// Builds the birth date field. When [FormHelper.isCardDesign(formHolder, fieldHolder)]
  /// returns true, it wraps the field content with a card design.
  static Widget buildBirthDateField({
    required BuildContext context,
    required BirthDateFieldHolder fieldHolder,
    DateTime? eventDate,
    required GlobalKey<FormBuilderState> formKey,
    required FormHolder formHolder,
  }) {
    final bool isCardDesign = FormHelper.isCardDesign(formHolder, fieldHolder);
    final birthDateField = BirthDateFieldBuilder(
      fieldHolder: fieldHolder,
      eventDate: eventDate,
      formKey: formKey,
      isCardDesign: isCardDesign,
    );
    if (isCardDesign) {
      return FormHelper.buildCardWrapperDesign(
        context: context,
        fieldHolder: fieldHolder,
        content: birthDateField,
      );
    }
    return birthDateField;
  }

  @override
  _BirthDateFieldBuilderState createState() => _BirthDateFieldBuilderState();
}

class _BirthDateFieldBuilderState extends State<BirthDateFieldBuilder> {
  DateTime? selectedDate;
  String? warningMessage;

  @override
  Widget build(BuildContext context) {
    // Determine effective event date (if provided, else now)
    final effectiveEventDate = widget.eventDate ?? DateTime.now();
    // Extract allowed ages; default values if not provided.
    final int effectiveMinAge = widget.fieldHolder.minYear ?? 12;
    final int effectiveMaxAge = widget.fieldHolder.maxYear ?? 100;

    // Calculate recommended birth date range based on the event date and age limits.
    final recommendedEarliestDate = DateTime(
      effectiveEventDate.year - effectiveMaxAge,
      effectiveEventDate.month,
      effectiveEventDate.day,
    );
    final recommendedLatestDate = DateTime(
      effectiveEventDate.year - effectiveMinAge,
      effectiveEventDate.month,
      effectiveEventDate.day,
    );

    // Determine picker limits.
    final pickerFirstDate = widget.fieldHolder.isHard ? recommendedEarliestDate : DateTime(1900);
    final pickerLastDate = widget.fieldHolder.isHard ? recommendedLatestDate : DateTime.now();

    // Localized date format.
    final dateFormat = DateFormat.yMd(context.locale.toString());
    FocusNode focusNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderDateTimePicker(
          focusNode: focusNode,
          name: widget.fieldHolder.id.toString(),
          inputType: InputType.date,
          initialDatePickerMode: DatePickerMode.year,
          format: dateFormat,
          fieldHintText: dateFormat.pattern,
          // When card design is used, use title as hint text.
          decoration: InputDecoration(
            label: widget.isCardDesign
                ? null
                : FormFieldBuilders.buildTitleWidget(
              widget.fieldHolder.title!,
              widget.fieldHolder.isRequired,
              context,
              focusNode: focusNode,
            ),
            hintText: widget.isCardDesign ? widget.fieldHolder.title : null,
          ),
          helpText: FormHelper.birthDateLabel(),
          firstDate: pickerFirstDate,
          lastDate: pickerLastDate,
          initialEntryMode: DatePickerEntryMode.calendar,
          inputFormatters: [LocaleDateInputFormatter(dateFormat: dateFormat)],
          validator: (value) {
            if (widget.fieldHolder.isRequired && value == null) {
              return FormBuilderValidators.required()(value);
            }
            if (value != null) {
              if (value.isBefore(recommendedEarliestDate) ||
                  value.isAfter(recommendedLatestDate)) {
                if (widget.fieldHolder.isHard) {
                  return widget.fieldHolder.message.isNotEmpty
                      ? widget.fieldHolder.message.tr(
                    namedArgs: {
                      "minAge": effectiveMinAge.toString(),
                      "maxAge": effectiveMaxAge.toString()
                    },
                  )
                      : "You must be between {minAge} and {maxAge} years old.".tr(
                    namedArgs: {
                      "minAge": effectiveMinAge.toString(),
                      "maxAge": effectiveMaxAge.toString()
                    },
                  );
                } else {
                  setState(() {
                    warningMessage = widget.fieldHolder.message.isNotEmpty
                        ? widget.fieldHolder.message.tr(
                      namedArgs: {
                        "minAge": effectiveMinAge.toString(),
                        "maxAge": effectiveMaxAge.toString()
                      },
                    )
                        : "Warning: Your age is not within the recommended range ({minAge}-{maxAge} years old).".tr(
                      namedArgs: {
                        "minAge": effectiveMinAge.toString(),
                        "maxAge": effectiveMaxAge.toString()
                      },
                    );
                  });
                }
              } else {
                setState(() {
                  warningMessage = null;
                });
              }
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              selectedDate = value;
            });
            widget.formKey.currentState!
                .fields[widget.fieldHolder.id.toString()]?.validate();
            FocusScope.of(context).unfocus();
          },

        ),
        if (warningMessage != null && !widget.fieldHolder.isHard)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: HtmlView(
              html: warningMessage!,
              color: ThemeConfig.warningColor(context),
              fontSize: 13.0 * FormHelper.fontSizeFactor,
              isSelectable: true,
            ),
          ),
      ],
    );
  }
}

class LocaleDateInputFormatter extends TextInputFormatter {
  final String pattern;
  final Set<String> allowedSeparators;

  LocaleDateInputFormatter({required DateFormat dateFormat})
      : pattern = dateFormat.pattern!,
        allowedSeparators = dateFormat.pattern!
            .replaceAll(RegExp(r'[0-9a-zA-Z]'), '')
            .split('')
            .toSet();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final filtered = newValue.text.split('').where((ch) {
      return RegExp(r'\d').hasMatch(ch) || allowedSeparators.contains(ch);
    }).join();
    return newValue.copyWith(text: filtered);
  }
}
