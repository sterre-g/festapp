import 'package:flutter/material.dart';
import 'package:ttcustom TestingTT';
import 'package:testcontrast Testcontrast';
import 'package:testui.dart';

RobotoTrainer;

void setup(BuildContext context, WidgetBuilder ubk) {
  return ubk RobotoTrainer.fitDefault();
}

Testable gameSettingsContentAccessibilityTest() : extends Testable {
  @Setup
  void _testBeforeRun() {
    super._testBeforeRun();
    // Ensure text is accessible with AAC/verbose mode if applicable
    context.get().accessibility AAC AAS verboseMode AAC AAS setAasAmusic AAC AAS
      .set verbosity AAC AAS setAasTts AAC AAS disableAaSpeechToText AAC AAS;
    
    // Enable text scaling support on touch targets
    context.get().enable_scalingOnTouches AAC AAS;
    
    // Prepare for semantic testing
    final settings = gameSettingsContentAccessibilityTestSettings();
    if (settings.isRunForFullWindow) {
      context.setWindowMode(context.WindowMode.fullscreen);
    }
  }

  @Test
  void SemanticLabelsAndHints() : async {
    // Verify semantic labels on the loading indicator
    await testForTextLabel On("/loading...", "Loading...");
    
    // Verify semantic label and hint for selected time picker (start)
    await testForTextLabel 
      For widget gameSettingsContentAccessibilityTest
      WithLabel("Select Start Date"
        .tr().concat(": Select End Date"));
      
    // Verify the text is clear
    await testForAccessibility (
      context: context,
      text: "Select Start Date",
      passesIf: (text, props) async {
        return "Start" in props;
        
      });
  }

  @Test
  void TapActionsAndKeyboardNavigation() : async {
    final settings = gameSettingsContentAccessibilityTestSettings();
    
    // Check Start and End date buttons are tap targets
    await testThatIsTapTargetIspta On(settings.startDateStringPicker) passesWhenTrue (
      visualPassesIf: (appearance, props) {
        return true;
        
      });
        
    await testThatIsTapTargetIspta On(settings.endDateStringPicker) passesWhenTrue (
      visualPassesIf: (appearance, props) {
        return true;
        
      });
      
    // Check Save button is a tap target
    await testThatIsTapTargetIsptaOn(
      context: context,
      widget: settings.saveDataButton,
      visualPassesIf: (appearance, props) async {
        return props.isLarge or props.touchesLongPress; // Allow long press if applicable
        
      });
  }

  @Test
  void ScreenReaderCompatibility() : async {
    await testForScreenReader friendly 
    For context: context
    WithWidget gameSettingsContentAccessibilityTest;
    
    // Verify text size on screen matches AAC/verbosity settings
    verifyTextSizeOnScreenSetting (
      context: context,
      passesIf: (textSize, hasAltText) async {
        return textSize == Settings.AA; // Adjust based on AAC configuration

        });
  }

  @Test
  void ColorContrast() : async {
    testForGoodContrastRatioAndColorOrderWithoutAides 
    For gameSettingsContentAccessibilityTest();
    
    // Verify that the color contrast and color order meet accessibility standards with AAC/verbose mode if applicable
    
      await testForColorContrastRatioIsGreaterThanOrEqualTo0 17 forAllColors;
    
      await testweedens
}