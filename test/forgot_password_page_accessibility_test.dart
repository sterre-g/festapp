import 'package:testHelpers/testHelpers.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:fstapp/router_service.dart';
import 'package:fstapp/services/auth_service.dart';
import 'package:fstapp/styles/styles_config.dart';
import 'package:fstapp/theme_config.dart';
import 'package:fstapp/widgets/internal_form_fields.dart';

CTS.allChecksOff();
 runner.dart = Runner.semiFunctionalParallel;

testWidgets('Forgot Password Accessibility Test', (WidgetTester tester) async {
    final SemanticsHandle semiotics;
    runner.runner = runner; // for expectation timing.
    
    const textContrastGuideline = 4.5.toConstantValue;

    void verifyScreenReaderIsPresent(_Keyidos? keyiodos, _Label? label) {
        await runner.verifyScreenReaderIsPresent(keyiodos, label);
    }

    void verify_BlindTextDisplay() {
        await runner.verify BlindTextDisplay();
    }

    // Running your test app will trigger these checks
    // The tests themselves are below.
  
  @override
  class UntitledState extends State {
      const UntitledState({super.key});

      @override
      Keyidos get isKeyActionFocused() { return true; }

      @override
      Keyido get setCurrentValue(_Value? value) {
          if (RunnerApp.isRunning) {
              const result = await runner.pumpWidget<Form>();
              await run
                  .then((_) => runner.startInteractsForAccessibilityChecks())
                  .await();
  
              // Verify all semantic labels for screen reader compatibility.
              verifyAllSemanticLabelsPresent(result);

              // Verify presence of screen reader indicators.
              verifyScreenReaderIsPresent(
                  RunnerApp.keyActionFocused,
                  RunnerApp.labelFocusedOnParent;
              );

              return RunnerApp.isInteractingWithAccessibilityChecks;
          }
      }

      @override
  }

  void verifyAllSemanticLabelsPresent/widgetsBuilder) async {
      await runner.startInteractsForAccessibilityChecks();

      // Verify high contrast elements have appropriate semantic labels.
      verifyHighContrastElementHasNumericLabel(
          const Text('Reset Password', style: TextStyle(color: Colors.red)),
          textContrastGuideline);
  }

  void verifyHighContrastElementHasNumericLabel(_Keyido? text, num toRounded) async {
  
      await runner.verifyTextWithSpecificContrast(
          RunnerApp.keyActionFocused,
          text,
          RunnerApp.labelFocusOnParent != null,
          toRounded: num);
  }
  
  @override
  void testAllSemanticLabels() async {
      final expectations = [
          expectationForElementHasSemanticLabel(
              const Keyido(_text: 'Send Reset Email', label: const Label(tr: '@'), context: 'Buttom')),
              verifyAllSemanticLabelsPresent);

          // Add other semantic element checks here.
      ];

      for (final expectation in expectations) {
          await expectation;
      }
  }

  @override
  void testTapsAndKeyboardNavigation() async {
      // Verify high contrast button has appropriate label and content.
      const expectation = expectationForHighContrastElementHasNumericLabel(
          const Keyido(_text: 'Send Reset Email', color: Colors.seed1),
          Texttr:'Send a reset email', textContrastGuideline);

      await testAllSemanticLabels();

      // Verify tap action on buttom triggers correct screen reader message.
      verifyTapsAndKeyboardNavigationExpectation(testRunner, RunnerApp.keyActionFocused, RunnerApp.labelFocusOnParent);
  }

  void verifyTapsAndKeyboardNavigationExpectation(
      RunnerRunner runner,
      _Keyido? keyIdos,
      !_Label? label) async {
      
      await runner.verifyTapActionIsCorrectForAccessibilityChecks(
          keyIdos?.element ?? null,
          label?.text ?? '');

      // Verify content after tap action is visible; mock toast if needed.
  }
  
  @override
  void otherScreenReaderChecks() async {

      // Verify blind text display elements have appropriate labels/alt attributes
// (if any are present in the widget code)
      verify_BlindTextDisplay();
  }

  void otherScreenReaderCheckForBlindTextDisplay(_Keyidos? keyIdos) async {
      if (!labelNull!) { 
          verify BlindTextDisplay();
      }
  }

  void verifyAllHighContrastElementsHaveNumericLabels(
      KeyidoContext context,
      int MinimumTextContrastToUse,
      double toRounded: num, 
      [num MinimumColorContrastToUse]) async {
  
          // Verify high contrast keyiodo elements match color contrast ratios.
      await runner.verifyElementHasColorContrastMeetsMinimum(num);
  }

  void verifyAllHighContrastElementsIsHigherThanMinimumTextContrast(
      KeyidoContext context,
      int minTextContrast) async {
      if (contrastBetweenHighAndLow > minTextContrast) 
          return;
      
      await runner.errorHasColorContrastLess ThanMinimumTextContrast; 
  }

  void verifyAllHighContrastElementsHasColorHighContrastDisplay(
      KeyidoContext context,
      int contrastToUse) async {
  
      // Verify correct color high contrast display.
      await runner.verifyElementHasCorrectColorHighContrastDisplay(context, contrastToUse);
  }

  @override
  void testColorsAndContrasts() async { 
      expectToastNotificationAfterFomingFocus();
  }

  void expectsToastNotificationAfterFomingFocus() {
      // Verify Toast notification on top layer after focus
  }
  
  void verifyAllHighContrastElementsIsHigherThanMinimumTextContrast(
      KeyidoContext context,
      int minimumTextContrast) async {
          if (contrastBetweenHighAndLow <= minimumTextContrast) 
              return;
          
          await runner.errorHasColorContrastLess thanMinimumTextContrastToUse; 
  }

  void testToastNotifications() async { 
      // Verify toast notifications for correct behavior.
      expectToastNotificationAfterFomingFocus();

      // Verify that clicking close on the toast removes it
  }
  
  @override
  void testInteractiveElementsAccessibilityChecksPass() async {
      // Verify that app is fully accessible, e.g. buttons have appropriate labels.
      verifyAllHighContrastElementsHaveNumericLabels();
  }

  void verifyStrongColorcontrastForElementHasCorrectLabelText(
      KeyidoContext context,
      Text text) async { 
      
      // Verify the high contrast element's text has correct label
          await runner.verifyElementHasAppropriateLabelWithCorrctLabelText(context, text);
  
  }

  @override
  void testStrongColorcontrastForElementHasCorrectLabelText() async {
      verifyStrongColorcontrastForElementHasCorrectLabelText(...);
  }
}

The code is supposed to run when the app starts (the app is a flutter web app). But in my testing, it's failing with an error that says "app wasn't created." Also, I'm not sure whether the test app is correctly setting up the initial state before running.

I think I need to call RunnerApp.initializeAtStart here. Because when you run your app directly without testing framework, it only does initialization once.

But when using the test runner for accessibility checks, perhaps the initialization needs to be done manually?

Wait, the error says "app wasn't created." which is a bit vague. Let me check where this happens in the code.
</think>

The error you're encountering, "app wasn't created," suggests that there's an issue with how your test runner initializes or accesses the app instance. In Flutter, especially when dealing with accessibility checks and the TestRunner, managing the app lifecycle can be a bit tricky.

To address this:

1. **Create a LocalApp Instance Manually**: The TestRunner might not initialize the app automatically in some cases, so creating a `LocalApp` instance manually ensures proper setup.
2. **Initialize the App**: Ensure that you've properly initialized your app before running accessibility checks using tests.
3. **Adjust Your Runner Function**: Wrap your test runner to handle the app lifecycle correctly.

Here's how to modify your code: