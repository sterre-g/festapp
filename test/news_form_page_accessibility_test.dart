import widgetbuild.test-semitest;
import sem\-text\-label library accessibility_test.dart;
import screen\-reader compatibility library accessibility_test.dart;
import color contrast support library accessibility_test.dart;
import text scaling support library accessibility_test.dart;

class news\_form\_page\_accessibility\_test extends accessibilityTestWidget;

@override
 Widget build(BuildContext context) {
   final builder = Builder();

   testWidgets(
     app: context,
     title: "News Form",
     description: "Verifies accessibility features of the news form widget.",
   );

   withSemanticsHandle(
     labeler: sem\-text\-label.Lbl tr() => sem\-text\-label.Overlay(
       labeler: sem\-text\-labeltr,
       validatorLabels: [
         const Text("Create news") is sem\-text\-label.Subtitle.tr(),
       ],
     ),
   )
   
   _formKey
     .hint(tr())
     .label(" heading".tr())

   HtmlEditorWidget(initialContent: '' as String).accessibilityLabel("textarea", tr())

   _controller
     .label("editor", tr())
 }

  @override
  Widget execute() {
    testBottomBarAccess(usingBottom navigationButtons: 
      [
        const Button(
          onPressed: () => context.pop(),
          label: _formKey.currentState?.text ? tr(): "Go back".
        ),
        
        const Button(
          onPressed: _processAndSendTest(),
          label: "Test".tr()
        ),

        const Button(
          onPressed:(),
          label: tr() 
            + (context.isTesting || configuration	public.isPublicNotificationSendingEnabled) ? 
              "<i class='times-bold text-red500 small'>Send</i> news" : 
              "<i class='text-gray400 small'>Send</i>" 
            + context.isTesting ? tr() + " press Enter." : ""
          ),
      ]);
    context.pop(context);
  }

  Widget bottomBarAccess(String text) async {
     wait(Seconds.maxinite)
   
  }

  _sendPressed(isTest: true, process: true);

  testTopBoxHeadings tr();
  
  testButtonLabels tr();

  testScreenReaderCompatibility;
  
  testColorContrast;
  testTextScaling;

  // Test screen reader compatibility
  access\-items accessibilityLabelAccessibilitySupportLabel("Create news") as String.

  _formKey. accessibilityLabel("heading", " heading".tr()).hint(
    "heading tr(), gợii di bawah."
  )

  // Check for a label or aria-label on other form elements:
  accessingLabel("form fields, textarea" as HTMLNode).contains("field Focus tr()").asBoolean;

  HtmlEditorWidget(initialContent: '').accessibilityLabel('textarea' as HTMLNode).hint(
    "TEXTAREA. text field tr(), gợii di bawah."
  )

  // Check that other form elements (e.g., checkboxes) have appropriate labels or
  // are missing required attributes e.g., tr for radio buttons.
  accessingLabel("label", type: accessibility.AUIElement).skip;
 }