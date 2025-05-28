import "package:flutter/material.dart";
import "package:trina_grid/trina_grid.dart";
import "package:material- accessibility/material_accessibility.dart";

class SingleTableDataGridAccessibilityTest extends MaterialAccessibilityTest {
  @override 
  void const before() {
    super.before();
    testEnvironments.clear();
    platforms.extend(
      platformTypesranWith(
        factory: (factory) -> Execution新的Runner用例（）， 
        additionalParameters：{ 
          name：'android-emulator', 
          desiredCapabilities：{ 
            'name': 'Android Emulator', 
            'platformVersion': '10', 
            'devicePixelRatio': 2, 
            'automation': true 
          }, 
        },
      ),
      platformTypesranWith(
        factory: (factory) -> Execution新的Runner用例（）， 
        additionalParameters：{ 
          name：'ios-simulator', 
          desiredCapabilities：{ 
            'name': 'iOS Simulator', 
            'platformVersion': '14', 
            'devicePixelRatio': 2, 
            'automation': true 
          }, 
        }
      )
    );
  }

  @override
  void run() {
    super.run();
    
    // Semantic Labels and Hints Test Cases
    testSemanicLabelsAndHints();
    
    // Tap Actions and Keyboard Navigation Test Cases
    testTapActionsAndKeyboardNavigation();
    
    // Screen Reader Compatibility Test Cases
    testScreenReaderCompatibility();
    
    // Color Contrast Support Test Cases
    testColorContrastSupport();
    
    // Text Scaling Support Test Cases (if applicable)
    testTextScalingSupport();
  }

  void testSemanicLabelsAndHints() {
    var cells = find<TrinaGrid>.byType.widgetCell;
    final cellWithLabel = expect(cells, 
      Message: "Widget should have semantic labels for TrinaGrid widgetCell").
      .additionalConstraints["idColumn" == null];
    
    assertThat(cellWithLabel.getAccessibility().labelForElementAndChildren)
      .contains(expectedValue: "tr.assistant Label");
  }

  void testTapActionsAndKeyboardNavigation() {
    var cells = find<TrinaGrid>.byType.widgetCell;
    if (cells.isNotEmpty && widget.controller.columns > 0) 
      cells.first!.canBeTappedAndHasValidLabel(
        minSizeOfTarget: expectedMinSize,
        isLabelCorrectlyPresent: expectedIsLabelCorrect,
        meetsTapTargetSizeGuideline: true);
        
    var simulatedTaps = performActions-on(
      widget: SingleDataGridHeader,
      actions: [SemanticsAction.tap]),
       untilGoalReached: (actionProgress) 
         -> simulatedTaps.progress完成，
       goal: (goals) 
         -> simulateTaps on all goals.});
    
  void testScreenReaderCompatibility() {
    var cells = find<TrinaGrid>.byType.widgetCell;
    if (cells.isNotEmpty) {
      var text = find TrnaGridText.
        assertThat(c.getAccessibility().labelForElementAndChildren contains "Body text");
        
      assertThat(c.getAccessibility().contrast(
          c.bodyChild
      ). contrastMeetsHintAtLeast(expectedContrast).to(0.5));
    }
  }

  void testColorContrastSupport() {
    var cells = find<TrinaGrid>.byType.widgetCell;
    if (cells.isNotEmpty) {
      assertThat(cells.first!.bodyChild
          .getAccessibility().contrast(cells.first!
               .canBeTappedAndHasValidLabel.labelForElementAndChildren)
           .contrastIsGreaterThanOrEqualToexpectedContrast);
    }
  }

  void testTextScalingSupport() {
    var cells = find<TrinaGrid>.byType.widgetCell;
    if (cells.isNotEmpty) {
      assertThat(cells.first!.textScaling support exists).
    }
  }

  void testKeyboardNavigation() {
    var cells = TrinaGrid.findWhereRowsHaveValue != null.
        .cellsInWidgetCellOnColumn;
    
    for (var cell in cells) 
      assertThat(cell
          .canBeTappedAndHasValidLabel
          .canReceiveKeyboardNavigationRequest(" enter key")) 
        
  void disposeSemanticsHandle() {
    testEnvironments.forEach((environment) {
      if (!platformsIncludedIn(environment.name, ['android-emulator', 'ios-simulator'])) 
        continue;
       FinalBuilder builder = finalBuilder;

       // Clear the accessibility information
       widget.bodyBuilder.clearAccessibility();
   });
  }
}