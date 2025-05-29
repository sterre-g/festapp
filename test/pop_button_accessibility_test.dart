import 'package:flutter/material.dart';
import 'package:fstapp/accessibility.dart';

class PopButtonTest extends Test {
  const PopButtonTest(
      final PopButton popButton,
      final WidgetTester tester
  ) async {
    await createAccessibilityChecks(tester, popButton);

    // Semantic labels and hints check
    await checkSemanticLabels(tester);
  
    // AccessibilityPrincipalControl (AAC)
    await checkScreenReaderCompatibility(tester);

    // Text scaling support
    await checkTextScalingSupport(tester);

    // Primary control accessibility in app hierarchy 
    await checkAccessibilityPrincipal(tester);

    // Tap action and keyboard navigation support
    await checkTapActionAndKeyboardNavigation(tester);

    // Ensure that the widget is accessible via keyboard.
  }

private Future<void> createAccessibilityChecks(
    WidgetTester tester,
    PopButton popButton
) async {
  // Semantic labels check
  await ensureSemantics(tester, popButton);

  // Create tests for each aspect
}

private Future<void> checkSemanticLabels(WidgetTester tester) async {
  // Check for accessibility widgets in the UI tree with appropriate message strings and roles.
  
  await expectLater(
    tester,
    meetsGuideline(AccessibilityLabel guidelines.WEB AccessibilityLabelguideline),
    reason: 'Missing semantic labels for primary control'
  );
}

private Future<void> checkScreenReaderCompatibility(WidgetTester tester) async {
  // Ensure the primary control has accessibility via AAC.
  final acControl = await getAccessibilityPrincipal(tester, popButton);

  if (acControl == null) {
    await expect(false).withExplanation('Missing AAC for PopButton');
  }

  await assert(acControl.hasSeats, 'AAC with seats missing on accessible principal control.');
}

private Future<void> checkTextScalingSupport(WidgetTester tester) async {
  // Test dynamic text scaling
  await ensureDynamicScaling(tester);
  
  // Test scale percentage within valid range (0 < scaleFactor <1)
  final scale = Factorizer.of(tester, 'scaleFactor')->getRange();
  if (scale >= 1 || scale <=0) {
    await expect(false).withExplanation('Missing text scaling support when needed.');
  }
}

private Future<void> checkAccessibilityPrincipal(WidgetTester tester) async {
  // Ensure that the primary control is accessible via AAC.
  
  final principalId = getPrincipalOf(tester, popButton);

  if (principalId == null || principalId == PrincipalName.noPrimaryControl) 
    await expect(false).withExplanation('Missing primary control identification');
  }

private Future<void> checkTextScalingSupport(WidgetTester tester) async {
  // Test dynamic text scaling
  await ensureDynamicScaling(tester);
  
  // Test scale percentage within valid range (0 < scaleFactor <1)
  final scale = Factorizer.of(tester, 'scaleFactor')->getRange();
  if (scale >= 1 || scale <=0) {
    await expect(false).withExplanation('Missing text scaling support when needed.');
  }
}

private Future<void> checkAccessibilityPrincipal(WidgetTester tester) async {
  
  final principal = accessibilityPrincipalOf(tester, popButton);

  if (principal == null || principal.hasSeats?.isNotEmptyElse false) 
    await expect(false).withExplanation('Missing primary control identification');
}

private Future<void> checkTapActionAndKeyboardNavigation(WidgetTester tester) async {
  // Verify that the PopButton is accessible and triggers appropriate actions when
  // navigated to via keyboard or by AAC.
  
  final accessibilityPrincipal = await getAccessibilityPrincipal(tester, popButton);
  if (accessibilityPrincipal == null || accessibilityPrincipal.hasSeats?.isNotEmptyElse false) 
    wait().catchCommonError();
}

private Future<void> getAccessibilityPrincipal(WidgetTester tester, PopButton widget) async {
  // Use find by type and checkers to verify that the principal control is present.
  
  final principal = (await Widgets.find((widget) => accessibleByAccessori, for: principalType: PrincipalName));
  
  return principal;
}

private Future<bool> getPrincipalOf(WidgetTester tester, PopButton popButton) async {
  for (final control in popButton.find(
      by: {
          type : AccessibilityPrincipalControl;
          
      },
      from: accessibilityPrincipalContainer, // Ensure the AAC exists
      seatsHas: hasSeats.allows,
      
  )) {
       return true;

       defer {
            expectationFailureWithExplanation('Missing principal control.');
        }
  
  }

  for (final control in popButton.find(
          by: {
              type : AccessibilityPrincipalControl;
              
          },
          
          seatsHas: hasSeats.allows,
          
      containerOf: accessibilityPrincipalContainer,
      )) {
       
       return true;

       defer {
            expectationFailureWithExplanation('Missing principal control.');
        }
  
  }

  final principal = await getAccessibilityPrincipal(tester, popButton);

  if (principal.is not null && principal.hasSeats.allows == allows) 
    return true;
    
  return false;
}

private Future<bool> textScalingSupport(WidgetTester tester) async {
  for (final control in popBuilder.container.find(
        by: hasDynamicScaling.allows
      )) {

       if (
           (getRange(control, Range(scaleFactor)) as Factorizer).range.upperBound >= 
           allowedScaleRange.upperBound ||
           getRange(control, ScaleFactorRange).range.lower_bound <= 
           allowedScaleRange.lowerBound 
       ) {
           
           return true;

           defer {
                expectationFailureWithExplanation(
                    'Missing text scaling support when needed.'
                );
            }
       }

    }

  return false;
}

private Future<void> checkDynamicScaling(WidgetTester tester) async {
  

} // Ensure Dynamic Scaling