import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fstapp/router_service.dart';
import 'package:fstapp/app_config.dart';
import 'package:fstapp/data/models/user_info_model.dart';
import 'package:fstapp/data/services/auth_service.dart';
import 'package:fstapp/data/services/db_users.dart';
import 'package:fstapp/services/html_helper.dart';
import 'package:fstapp/styles/styles_config.dart';
import 'package:fstapp/widgets/buttons_helper.dart';
import 'package:fstapp/widgets/html_editor_widget.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

@RoutePage()
class NewsFormPage extends StatefulWidget {
  static const ROUTE = "newsForm";

  const NewsFormPage({super.key});

  @override
  _NewsFormPageState createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  late QuillEditorController _controller;
  final bool _sendWithNotification = true;
  final FocusNode _toFocusNode = FocusNode();
  UserInfoModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _controller = QuillEditorController();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _currentUser = await DbUsers.getCurrentUserInfo();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    _toFocusNode.dispose();
    super.dispose();
  }

  void _stornoPressed() {
    Navigator.pop(context);
  }

  Future<void> _sendPressed({bool isTest = false, bool process = false}) async {
    var htmlContent = await _controller.getText();
    htmlContent = HtmlHelper.removeColor(htmlContent);
    if (process == true) {
      htmlContent = HtmlHelper.detectAndReplaceLinks(htmlContent);
    }
    if (htmlContent.isNotEmpty) {
      var toReturn = {
        "content": htmlContent,
        "heading": _formKey.currentState?.fields["heading"]!.value,
        "heading_default": _currentUser!.name,
        "with_notification": _formKey.currentState?.fields["with_notification"]!.value,
        if (isTest || AppConfig.isPublicNotificationSendingDisabled) "to": [AuthService.currentUserId()],
        if (isTest) "add_to_news": false,
      };
      Navigator.pop(context, toReturn);
    } else {
      debugPrint('Content is required');
    }
  }

  Future<void> _processAndSendTest() async {
    _sendPressed(isTest: true, process: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Create news").tr(),
          leading: BackButton(
            onPressed: () => RouterService.popOrHome(context),
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: StylesConfig.appMaxWidth),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: "heading",
                          focusNode: _toFocusNode,
                          decoration: InputDecoration(
                              labelText: "Heading".tr(),
                              hintText: _currentUser?.name,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        FormBuilderCheckbox(
                          name: 'with_notification',
                          initialValue: _sendWithNotification,
                          title: const Text("Send with notification").tr(),
                        ),
                      ],
                    ),
                  ),
                ),
                HtmlEditorWidget(
                  initialContent: '',
                  controller: _controller,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          color: Colors.grey.shade200,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Row(
                children: [
                  ButtonsHelper.bottomBarButton(
                    onPressed: _stornoPressed,
                    text: "Storno".tr(),
                  ),
                  ButtonsHelper.bottomBarButton(
                    onPressed: _processAndSendTest,
                    text: "Test",
                  ),
                  ButtonsHelper.bottomBarButton(
                    onPressed: () => _sendPressed(process: true),
                    text: "Send".tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
