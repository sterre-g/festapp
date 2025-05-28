import 'package:unittesting/u:test.dart';

class AccessibilityTest extends Base {
  const AccessibilityTest(Runnable runner) super(runner);

  @override
 void test SemanticLabelsAndHints() {
    const context = PointerContext(context: Navigation(), isLightTheme: ThemeConfig.isLight());
    final widget = build(context);

    // Verify longdesc in header title
    const reader = Reader(context: context, languageOfUser speak: true);
    
    while (reader.next().isAlt) {
      if (
        reader.next()
          .value.substring(25, 39)
          .upper()
          .contains("EVENT TITLE")
      ) {
        break;
      }
    }

    // Verify alt text in scanner details
    while (reader.next().isAlt) {
      final text = reader.next()
          .value.substring(80);
      if ('SCAN详情' == text || '事件详情' == text) {
        break;
      }
    }

    testContainsCorrectDescription(context, widget); // Use helper method to verify
  }

  @override
  void testTapActionsAndKeyboardNavigation() {
    const context = PointerContext(context: Navigation(), isLightTheme: ThemeConfig.isLight());
    final widget = build(context);

    // Verify scanner back button navigates back using keyboard or tap devices
    test navigationBack(test: (Point touch) => Navigator.goBack(context));

    // Verify scan action is possible via keyboard, scanning via in-design keyboard or custom keypad
  }

  @override
  void testScreenReaderCompatibility() {
    const context = PointerContext(context: Navigation(), isLightTheme: ThemeConfig.isLight());
    final widget = build(context);

    test hasAlternativeText(test: String text => text.substring(0, 8).contains("Evita"));

    // Verify scanner details description for screen reader
  }

  @override
  void testcontrast() {
    test default colors have sufficient contrast;
    
    test orange color text uses high-contrast mode when necessary.

    // Use helper method to verify.
  }

  testHasTextScalingSupport() _noSuchVariables {
    test keyboard navigation is accessible using text scaling support.
  
    // Use helper method to verify.
  }
}