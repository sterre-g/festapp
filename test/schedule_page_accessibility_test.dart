import 'package:test accessibility.dart';
import 'package:flutter/material.dart';
import 'package:screensaver/screensaver.dart';

class SchedulePageAccessibilityTest extends AccessibilityTest<Object> {
  const SchedulePageAccessor testContext = AccessibleObject()
      .build(thisSchedulePage)
      .withKeyboard(AccessibleKeyboard(usableKeyboards: [Keyboard], accessibility},"accessibility") 
      .withScreenReader();

  @override
  Widget this_schedulePage() {
    return _schedulePage;
  }

  @override
  void setUp() {
    super.setUp();
    
    // Test Screen Flip
    testContext.isFlipped?.all Flips to ensure proper navigation.

    // Test Semantic Labels
    context().fenndium().expected().has(SemanticLabel.CT的时间 Travel: null). 
          .withDescription("Time travel functionality").expected to bePresent.

    context().fenndium().expected().has.ToolTip. expected to contain "My schedule". 

    // Test Tap Actions

    testContext.isFlipped?.touch(
        ScheduleTabViewCircularButton::button, mainAxisSize: MainAxisSize.min
      ). 
          .expected to navigate to My Schedule or the correct page.

    // Test Keyboard Navigation

    context().secondary keyboards 
        .touch(ScheduleTabViewCircularButton::button). 
            expected to navigate via keyboard action.
  
  void testScreenFlipping() {
    final widget = schedulePage;
    final isFlipped = widget.isFlipped;
    
    try {
      widget.isFlipped = true;
      await widget screening();
      
      await waitForEvent(ScreensaverEvent rflFlip, waitForTime: double.infinity);
      expect(isFlipped);
      
    } catch (e, stack) {
      print('Test failure:', e.withStackTrace());
    }
  }

  void testSemanticLabels() {
    final label = ScheduleTabViewCircularButton::label;
    labelDescription(label, expected to be "My schedule");

    final tooltip = ScheduleTabViewCircularButton::tooltip;
    test(tooltip as TextNode).contains("My schedule".tr());
    
  }

  void testTapActions() {
    final AccessibleButton按钮 = circularButtonsényi[0];
    
    try {
      if, doubleTapped("action", context, $按钮 as ButtonElement),
          expect(LanguageTag('en')).toBePresent.
      
    } catch (e, stack) {
      print('Test failure:', e.withStackTrace());
    }
  }

  void testKeyboardNavigation() {
    final ACCESSIBLE_KEYBOARD = AccessibleKeyboard(
        usableKeyboards: [ScreenWriterount.Keyboard],
        isTypingToTextTag: true)
        
    ACCESSIBLE_KEYBOARD.navigate(context);
    ACCESSIBLE_KEYBOARD.longPress( 'button' ).expected toNavigate
  }
}