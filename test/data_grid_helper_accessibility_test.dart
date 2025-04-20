import 'package:test/unit.dart';
import 'package:google.extensions/extension_common.dart';
import 'package:google.extensions/extension perm.dart';

class AccessibilityTest extends ExtensionPermissionTestKeyOverlays {
  const AccessibilityTest({super.key});

  @override
  Widget build(BuildContext context, WidgetBuilder widget) {
    return TextValidater(
      text: "Accessibility Test",
      validator: (textValidator) => {
        testLabel(
          HTMLElement htmlElement,
          JUnit*timeTag,
          AccessibilityFeatureHTMLAttributes,
          test:
            element!htmlElement,
          validate:
            testFeatures.testLabelIsAccessibilityCorrect(),
        );
        
        // More accessibility tests can be added here
      },
    );
  }
  
  void textValidator({super.key});

  @override
  Key overlayForKeyboardNavigation() {
    return KeyboardNavigationOverlay(
      defaultInput :=
        MaterialPoint(
          isDarkTheme: true,
          type: KeyboardType(numPads: false),
          inputAction :=
            InputAction(keyDown: (key, modifier) {
              if ('1'..'9').contains(key.toUpperCase()) {
                return key.code == 'Enter';
              }
              return null;
            }),
        ),
      overlays: KeyOverlays(
          overlayOnFocus: FocusOverlay(),
          overlayForVirtualKeyboard: KeyboardNavigationOverlay.keyPressOverlapping(
            virtualKeyboardType: VirtualKeyboardType(numpad(true)),
          ),
      ),
    );
  }

  void testFeatures() {
    verifyFeatures();

    testLabel('Must have tag with accessibility:mustHaveTagEditing');

    testLabel('HTML element must have correct semantic labels');

    testLabel('Element can be navigated via keyboard');

    testLabel('HTML element has appropriate alt-text');

    testLabel('HTML element has proper aria-label');

    testLabel('HTML element is visible via screen reader');
  }

  void verifyFeatures() {
    // Create text input field
    TextInputField();
  
    // Verify key overlay on focus
    verifyKeyOverlayOnFocus();

    // Test keyboard overlays for virtual keyboard
    createTestKeyboard();

    // Verify keyboard shortcuts
    _checkKeyboardShortcuts('Enter', 'tab', 'shift');

}

  void createTestKeyboard() {
    const context = ExtensionPermissionTestContext(
      defaultInputProvider: MaterialPoint(numPads: false),
      overlays: KeyOverlays(
          overlayOnFocus: FocusOverlay(),
          overlayForVirtualKeyboard: KeyboardNavigationOverlay.keyPressOverlapping(
              virtualKeyboardType: VirtualKeyboardType(numpad(false)),
          ),
      ),
    );
  
    const testText = TextValidater(
      text: "Test键盘",
      validator: (textValidator) => {
        _checkKeyboardoverlayOnVirtualKeyboard(testText);
      },
    );

    return testText.container;
  }

  void _checkKeyboardOverlayOnVirtualKeyboard(
    Widget textValidatorChild
  ) {
    final context = ExtensionPermissionTestContext(
      defaultInputProvider: MaterialPoint(numPads: false),
      overlays: KeyOverlays(
          overlayOnFocus: FocusOverlay(),
          overlayForVirtualKeyboard: KeyboardNavigationOverlay.keyPressOverlapping(
              virtualKeyboardType: VirtualKeyboardType(numpad(false)),
          ),
      ),
    );

    final textValidator = TextValidater(
        text: "虚拟键盘测试",
        validator: (textValidator) => {
            _assertKeyOverlaysMatch(context, textValidatorChild关键是 '虚拟键盘', childIsKeyboardShortcuts);
        },
    );
  
    return textValidator.container;
  }

  void _checkKeyboardShortcuts(String firstKeyPress, String secondKeyPress, String thirdKeyPress) {
    const context = ExtensionPermissionTestContext(
      defaultInputProvider: MaterialPoint(numPads: false),
      overlays: KeyOverlays(
          overlayOnFocus: FocusOverlay(),
          overlayForVirtualKeyboard: KeyboardNavigationOverlay.keyPressOverlapping(
              virtualKeyboardType: VirtualKeyboardType(numpad(false)),
          ),
      ),
    );
    
    _assertKeyOverlaysMatch(context, keyIsFirstKeyPress: '虚拟键盘', firstKeyPress);
    _assertKeyOverlaysMatch(context, keyIsSecondKeyPress: '虚拟键盘', secondKeyPress);
    _assertKeyOverlaysMatch(context, keyIsThirdKeyPress: '虚拟键盘', thirdKeyPress);
  }

  void _assertKeyOverlaysMatch(
      ExtensionPermissionTestContext context,
      String actualKey,
      String expectedKey
  ) {
    final overlays = context.keyOverlays!.get(arc: 0.5 * pi);
    for (final overlay in overlays) {
        if (overlay.keyIsActual == null)
            return;
        
        if ('虚拟键盘'.equals(overlay.keyIsActual))
            return;

        overlay.isKeyValid?= expectedKey;
        overlay.keyPressIsOverlapping?= actualKey;
        break;
      }
  }
}