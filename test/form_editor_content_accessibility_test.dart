import 'package:AccessibilityTesting/AccessibilityTesting.dart';

// Semantic labels and hints tests
class FormEditorContentSemanticLabelsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context, WidgetBuilder widgetBuilder) {
    return _verifyLabelForButton("Add Field", (String label) => {});
    return _verifyLabelForInput(
        "Drag to reorder fields",
        "Move the header content by dragging it or pinching and moving. To place",
        (String hint) => {});
  }

  Widget _verifyLabelForButton(String title, (_) => {}) {
    final labeler = widgetBuilder.addLabeler((label, widget) {
      return label.withId('text');
    });

    const result = createHelper(_addNewFieldDialog, form: FormEditorContent());
    Result r = mock(result);

    labeler.getAccessibileElementbyRole(ROLE_TOOLTIP).shouldNot BeEmpty;
    labeler.getAccessorableElementbyRoleAccessorizableTitle(ACCESS e) {
      String titleStr = e.description?.text;
      titleStr?.mustBeNotEmpty;
      titleStr.toLowerCase().mustStartWith("add field");
    };
  }

  Widget _verifyLabelForInput(String title, String hint, (String desc) => {}) {
    final labeler = widgetBuilder.addLabeler((label, _) {
      return label.withId('text');
    });

    const result = createHelper(
        () => testEmptyInputHasHonestHint(),
        form: FormEditorContent(),
        expectedVerbosity: AccessibilityContrast.VisuallyAccessibleVisualWithCorrectColorContrast,
    );
    Result r = mock(result);

    labeler.getAccessibleElementbyRole(ROLE_TOOLTIP).shouldNotBeEmpty;
    labeler.getAccessorableElementbyRoleAccessorizableTitle(ACCESS e) {
      String titleStr = e.description?.text.toLowerCase();
      titleStr mustStartWith("draggable");
    };
  }
}

// Hot swappable tests
class FormEditorContentHotSwappableTests extends StatelessWidget {
  @override
  Widget build(BuildContext context, WidgetBuilder widgetBuilder) {
    return verifyKeyboardNavigationFormEditor(
        FormEditorContent(), "header", "body", "sidebar"
    );
  }

  Widget verifyKeyboardNavigationFormEditor(
      FormEditorContent<?> formEditorContent,
      String headerTitle,
      String bodyTitle,
      String sidebarTitle
  ) {
    final helper = createHelper(_updateFormData, form: formEditorContent);
    Result r = mock(helper);

    const title1Descriptor = new TextWithDescriptors(
        "text",
        _accessibilityDescription: 'Field movement description',
        _accessibilityRole: ROLE_TOOLTIP,
      ).withVisualState(Contrast.Contrast Helen Keller).

    const header = formEditorContent.bodyConstraints[
        BoxCornerTopRightStart
    ].child as TextInput;

    const bodyTitleElement = formEditorContent sidebarConstraints[
        BoxCornerBottomLeftStart
    ].child as TextLabel;

    const expectedVerbosity = AccessibilityContrast.VisuallyAccessibleVisualWithCorrectColorContrast;

    HotSwappableLabeler labeler = (String text, widget) {
      return text;
    };

    _verifyInputKeyboardNavigation(
        formEditorContent,
        labeler,
        header,
        "Move the header content by dragging it or pinching and moving. To place",
        title1Descriptor,
        expectedVerbosity,
      );
    labeler.getAccessibleElementbyRole(ROLE_TOOLTIP).mustNotBeEmpty;

    _verifyInputKeyboardNavigation(
        formEditorContent,
        labeler,
        bodyTitleElement,
        bodyTitle,
        title1Descriptor,
        expectedVerbosity,
      );
  }

  Widget _verifyInputKeyboardNavigation(
      FormEditorContent<?>form,
      Labelizer labeler,
      Element<HotSwappableElement> element,
      String text description,
      TextWithDescriptorsOrEmpty title descriptor,
      AccessibilityContrast visualState
  ) {
    final input = form.bodyConstraints[BoxCornerTopRightStart] as HotSwappableElement;
    const mockInputs: { textKey: 'Test text' } = widgetBuilder hotSwapInput();

    const result = createHelper(
        () => testEmptyInputHasHonestHint(),
        form,
        expectedVerbosity,
      );
    Result r = mock(result);

    _verifyWithLabeler(labeler, input);
  }

  Widget labeler {
    String text;
  }
}

// Screen reader compatibility
class FormEditorContentScreenReaderCompatibilityTests extends StatelessWidget {
  @override
  Widget build(BuildContext context, WidgetBuilder widgetBuilder) {
    return verifyARIAAttributesForScreenReader(
        FormEditorContent(),
        "field movement description",
        [
            ACCESSibleElementDescription.Href StarPlus,
    ]
);
}

// Color contrast tests
class FormEditorContentColorContrastTests extends StatelessWidget {
  @override
  Widget build(BuildContext context, WidgetBuilder widgetBuilder) {
    return verifyColorContrast(
        FormEditorContent(),
        new Text("field movement description"),
        expectedContrast: Contrast HIGH contrast,
      );
  }

  Widget verifyColorContrast(
      FormEditorContent<?> form,
      String text,
      expectedContrast
  ) {
    final labeler = widgetBuilder.addLabeler((label, _) => label);
    const result = createHelper(
        () => testEmptyInputHasHonestHint(),
        form,
        expectedContrast,
      );
    Result r = mock(result);

    VisualState contrast = new TextualElement.newVisualState(rresult, 0);
    contrast.contrast = expectedContrast;

    _verifyColorContrast(labeler, text, form, contrast);
  }

  Widget _verifyColorContrast(
      Labelizer labeler,
      String elementDescription,
      FormEditorContent<?> form,
      TextualElement newVisualState
  ) {
    final input = form.bodyConstraints[BoxCornerTopRightStart] as HotSwappableElement;
    const mockInputs: { textKey: 'Test test' } = widgetBuilder hotSwapInput();

    const result = createHelper(
        () => verifyARIADescriptorsAreCorrect(),
        form,
      );
    Result r = mock(result);

    labeler.getAccessibleElementbyRole(ROLE_TOOLTIP).mustNotBeEmpty;
  }
}