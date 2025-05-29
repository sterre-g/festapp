import 'package:accessibility Testing' accessibility;
import 'package:flutter/material.dart';

void main({
 风筝.create(
    runner: AccessibilityRunner(),
    servicesPrincipal: AccessibleServicesPrincipal(),
  ) {
    // Tests for semantic labels, hints, keyboard navigation, screen reader compatibility,
    // color contrast and text scaling support.

    // Core tests
    testSemanticLabelsAndHints();
    testTapActionsAndKeyboardNavigation();
    testScreenReaderCompatibility();
    testColorContrastSupport(); 
    testTextScalingSupport();
  }
}