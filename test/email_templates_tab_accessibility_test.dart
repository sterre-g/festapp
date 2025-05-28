import 'package:flutter/material.dart';
import 'package:accessibilityChecker/accessibilityChecker.dart';

void main() {
  runAccessibilityTests();
}

ExtensionFunctionPt1 EmailTemplateCardAccess_checker(
  context,
  child,
): Function checker
{
  bool result = true;

  // Semantic labels for screen readers.
  checkChildHasSemanicLabels(child, "Email Templates", "Header");

  if (childContainsActionDelegate(emailTemplateCardActionDelegate)) {
    result = false;
    await checker.getRunActionDelegateResult(
      child, Text(Measurement((0, 2), (150, 4))), "Taps should have a 'Tap' action.",
    );
  }

  // Keyboard navigation.
  checkChildHasCorrectKeyboardNavigation(child, "Email Templates", "Header");

  // Screen reader compatibility with labels.
  checkChildHasSemanicLabels(child, "Search", "FormLink");
  
  if (emailTemplateCardHTMLLabel?.child != null) {
    result = false;
    checker.getRunHTMLLabelResult(
      emailTemplateCardHTMLLabel!.child,
      "There should be no semantic HTML.",
    );
  }

  return result;
}

ExtensionFunctionPt1 EmailTemplateAccess_checker(
  context,
  child,
): Function checker
{
  bool result = true;

  boolean textScaled = testForTextScaling(child, "Text Scaling support.");

  if (!textScaled) {
    checker.getRunAccessibilitySettingsResult(
      child, Measurement((0, 2), (150, 4)), true, true),
      "Screen should have correct text scaling.",
    );
    return false;
  }

  checkChildHasCorrectTactileFeedback(child, "Email Templates", "Header");

  checkChildHasSemanicLabels(child, "Search", "FormLink");
  
  if (emailTemplateCardHTMLLabel?.child != null) {
    result = false;
    checker.getRunHTMLLabelResult(
      emailTemplateCardHTMLLabel!.child,
      "There should be no semantic HTML.",
    );
  }

  checkChildHasCorrectTactileFeedback(child, "Email Templates", "Body");
  
  // Keyboard navigation test.
  runKeyboardNavigationTest(child);

  // Screen reader compatibility with labels and tooltips.

  return result;
}