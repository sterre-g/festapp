import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fstapp/app_router.gr.dart';
import 'package:fstapp/data/models/form_option_model.dart';
import 'package:fstapp/router_service.dart';
import 'package:fstapp/dialogs/standard_dialog.dart';
import 'package:fstapp/pages/utility/html_editor_page.dart';
import 'package:fstapp/widgets/html_view.dart';

class OptionDetailEditorDialog extends StatefulWidget {
  final FormOptionModel option;
  final int? occasionId;

  const OptionDetailEditorDialog({super.key, required this.option, this.occasionId});

  @override
  _OptionDetailEditorDialogState createState() => _OptionDetailEditorDialogState();
}

class _OptionDetailEditorDialogState extends State<OptionDetailEditorDialog> {
  late String _description;

  @override
  void initState() {
    super.initState();
    _description = widget.option.description ?? "";
  }

  Future<void> _editContent() async {
    RouterService.navigatePageInfo(
      context,
      HtmlEditorRoute(
          content: {HtmlEditorPage.parContent: _description},
          occasionId: widget.occasionId,
      ),
    ).then((value) {
      if (value != null) {
        setState(() {
          _description = value as String;
          widget.option.description = _description;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StandardDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Text(
              "Description".tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            HtmlView(
              html: _description,
              isSelectable: true,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _editContent,
                child: Text("Edit content".tr()),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
