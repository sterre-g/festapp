import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fstapp/data/models/form_field_model.dart';
import 'package:fstapp/data/models/form_option_model.dart';
import 'package:fstapp/data/models/user_info_model.dart';
import 'package:fstapp/pages/form/widgets_view/form_helper.dart';

class SexEditor {
  static Widget buildSexFieldReadOnly(BuildContext context, FormFieldModel field) {
    final options = [
      FormOptionModel(UserInfoModel.sexes[0], FormHelper.maleLabel()),
      FormOptionModel(UserInfoModel.sexes[1], FormHelper.femaleLabel()),
    ];
    return Column(
      children: options.map((option) {
        return Row(
          children: [
            Radio<String>(
              value: option.title,
              groupValue: null,
              onChanged: null,
            ),
            Text(option.title),
            if (option.description != null &&
                option.description!.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Tooltip(
                      message: "Has description".tr(),
                      child: const Icon(Icons.description, size: 16),
                    ),
                  ],
                ),
              ),
          ],
        );
      }).toList(),
    );
  }
}
