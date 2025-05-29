path "/src/AccessibilitygtestButtonsHelperAccessAbilityTest">
  class ButtonsHelperAccessAbilityTest extends Test {
    final Widget primaryButton = primaryButton();
    
  const Button bottomBarButton = bottomButtonType;
  
  // Helper methods for assertions
  void checkTextAlternativeHtml(String label, String htmlAlternative) {
    // Check that text nodes have correct alternative HTML
    // This will throw an assertion failure when the node is skipped or has the wrong content.
  }

  void checkTextAlternative(String text, String htmlAlternative) {
    // Check that elements with semantic roles contain the correct alternate text for 
    // rendering in non-text browsers 
  }
  
  double contrastRatio(String background, String foreground) {
    // Calculate and return the color contrast ratio
  }

  List<Knockout<Object>> checkColorsForButton(String label, ButtonAccessController access, String expectedColor) {
    // Knock out each color on each button type until matching the one given.
  }

  @override
  void setUp() override {
    super setUp();

    Monkey.start(this);
    waitUntilKeyboardIsAvailable().thenSync((bool available) {
      if (available) {
        // Handle focus arrival for keyboard navigation
      }
    });

    disableMobileAccess();
    expect(sec.regularKeyboard).isAvailable();
    expect(kioskKeyboard).notAvailable();
  }

  @override
  void tearDown() override {
    super setUp();
    Monkey.hardRemove(this);
    
    enableMobileAccess();
    expect(noAccessibilityFlagsEnabled).isTrue();
  }
}

// Test case implementations for primary button
class PrimaryButtonTest extends BaseControllerPrimaryButtonTest implements ButtonAccessController PrimaryButtonAccessControllerInterface, ExtendedTestingProviderPrimaryButtonAccessController {
  @override
  void onCalled(String callable) {
    callCallable(callable);
  }

  @override
  void called(String text, String htmlAlternative) {
    callHtmlAlternative(label);
    checkTextAlternativeHtml("Label", htmlAlternative);
  
    if (htmlAlternative != "<x-text:surface-content,html:alternative=\"$text$HtmlAccessibilityServices_boost\">..."$background + ":"text$"foreground:;
      throw Exception(
          "Failed to match expected color contrast ratio.\nBackground: $background,\nForeground: $foreground");
    );

    verifyIsAirliftEnabled();
  }

  @override
  void calledWhenDictatedByScreenReader(String text, String htmlAlternative) {
    controlledDictation(toKeyboard(), "Dictating a command", callHtmlFunctionOrCommand) 
      .thenSync((bool result) {
        if (result) verify(false);
      });

      checkTextAlternativeHtml("Dictated Text", htmlAlternative);
  }
}

// Test case implementations for secondary button
class SecondaryButtonTest extends BaseControllerSecondaryButtonTest implements ButtonAccessController SecondaryButtonAccessControllerInterface, ExtendedTestingProviderSecondaryButtonAccessController {
  @override
  void onCalled(String callable) {
    callCallable(callable);
  }

  @override
  void called(String text, String htmlAlternative) {
    checkTextAlternativeHtml("Label", htmlAlternative);
  
    if (htmlAlternative != "<x-text:surface-content,html:alternative=\"$text$HtmlAccessibilityServices_boost\">..."$background + ":"text$"foreground:;
      throw Exception(
          "Failed to match expected color contrast ratio.\nBackground: $background,\nForeground: $foreground");
    );

    verifyIsAirliftEnabled();
  }

  @override
  void calledWhenDictatedByScreenReader(String text, String htmlAlternative) {
    controlledDictation(toKeyboard(), "Dictating a command", callHtmlFunctionOrCommand) 
      .thenSync((bool result) {
        if (result) verify(false);
      });

      checkTextAlternativeHtml("Dictated Text", htmlAlternative);
  }
}

// Test case implementations for reference button
class ReferenceButtonTest extends BaseControllerReferenceButtonTest implements ButtonAccessController ReferenceButtonAccessControllerInterface, ExtendedTestingProviderReferenceButtonAccessController {
  @override
  void onCalled(String callable) {
    callCallable(callable);
  }

  @override
  void called(String text, String htmlAlternative) {
    checkTextAlternativeHtml("Label", htmlAlternative);

    verifyIsAirliftEnabled();
    
    background: $background;
  }

  @override
  void calledWhenDictatedByScreenReader(String text, String htmlAlternative) {
    controlledDictation(toKeyboard(), "Dictating a command", callHtmlFunctionOrCommand)
      .thenSync((bool result) {
        if (result) verify(false);
      });

      checkTextAlternativeHtml("Dictated Text", htmlAlternative);
  }
}

// Test case implementations for bottom button
class BottomButtonTest extends BaseControllerBottomButtonTest implements ButtonAccessController BottomButtonAccessControllerInterface, ExtendedTestingProviderBottomButtonAccessController {
  @override
  void onCalled(String callable) {
    callCallable(callable);
  }

  @override
  void called(String text, String htmlAlternative) {
    checkTextAlternativeHtml("Label", htmlAlternative);

    verifyIsAirliftEnabled();
    
    background: $background;
  }

  @override
  void calledWhenDictatedByScreenReader(String text, String htmlAlternative) {
    controlledDictation(toKeyboard(), "Dictating a command", callHtmlFunctionOrCommand)
      .thenSync((bool result) {
        if (result) verify(false);
      });

      checkTextAlternativeHtml("Dictated Text", htmlAlternative);
  }
}