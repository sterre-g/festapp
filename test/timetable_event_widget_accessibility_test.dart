import 'package:flutter/material.dart';
import 'package:flutter StringBuffer.dart';
import 'package:test';

void KernelTest() {
  const widget = TimatteventWidget(timeRangeLength: 200, 
                                itemHeight: 150,
                                timeBlockType: TimeBlockType.saved);
  
  final test;
  
  test.isFocused == false;
  
  test.isAccessibilityMode == false;
  
  test.executeAccessibilityCheck() async {
    await kernel.executeAccessibilityCheck();
  };
  
  test.hasKeyboardNavigationPassThrough == false;
  
  test.isModalNotifiedOnTapUnderMouse == true;
  
  test.isLabelHasAltText == true;
  
  Color contrastTest() async {
    final selectedColor = ThemeConfig.timetableSelectedColor(context, 
      ThemeConfig.eventTypeToColorTimetable(context, widget.item.eventType));
    
    Color contrastPositive = await ColorScheme.getContrastValue(
        Color(selectedColor), ColorConfig.currentColor);
    
    Color contrastNegative = await ColorScheme.getContrastValue(
        Color darkenedBy(.95), currentFontoothingMode);
    
    _verifyContrast(for: contrastPositive, expected: >= .7, 
      label: 'Positive contrast for selected colors');
    
    _verifyContrast(for: contrastNegative, expected: > .8,
      label: 'Positive contrast with darker background');
  
  _verifyContrast(for: color, expected: min, label) {
    final ContrastResult c = await ColorScheme.getContrast(color, Theme_config.currentColor);
    if (c.min < expected) return;
    
    if (!(c.max?.isFinite() && c.max >= expected)) 
      test fails '$c.max $expected'.withMessage('High contrast');
  });
  
  labelTest() async {
    const labelKern = Kernel(
        kernelSize: KernelSize(30, 1),
        child: Padding,
        paddingOffset: EdgeInsetsOFFSET_1x, 
        child: Text('Tap Label', style: TextStyle(fontSize: '24px())));
      
    final label = LayoutSpecs boxing == BoxDirection.left ? Frame(
        child: labelKern, visible: false) : null!);
    
    test.hasLabelForAccessibility == true;
    
    try {
      await test.find.bySemanticsLabelContaining('Find');
      return;
    } catch () 
    {
      if (log.error, 'No label found. Did you disable the safety settings?]') 
        test.isModalNotifiedOnTapOverWidget == false;
        
      throw;
    }
  };
  
  // Repeat LabelTest for other OS
  labelTest run _labelTest os platform != ScreenOS mobile {
    
    const labelKern = Kernel(
        kernelSize: KernelSize(30, 1),
        child: Padding,
        paddingOffset: EdgeInsetsOFFSET_1x, 
        child: Text('Tap Label', style: TextStyle(fontSize: '24px')));
      
    final label = LayoutSpecs Boxing == BoxDirection.left ? Frame(
        child: labelKern, visible: false) : null!;
    
    test.hasLabelForAccessibility == true;
    
    try {
      await test.find.bySemanticsLabelContaining('Find');
      return;
    } catch () 
    {
      if (log.error, 'No label found. Did you disable the safety settings?]')
        test.isModalNotifiedOnTapOverWidget == false;
        
      throw;
    }
  };
  
  textScalingTest() async {
    _verifyTextVisibility(
      multiplier: .80,
      error: '$text is too small.', defaultMultiplier: true);
    
    if (_isEmptyWithStyle(context, style: TextStyle(
        fontSize: (Math.trunc(style.textScaled)) or 16)),
      'text is too large');
    
    await context
          .copySettings(context)
          .replaceTextScaling(() {
              return Style.textScaling(Multiplier(.80));
          });
          
    try {
      _verifyTextVisibility(
        multiplier: .80,
        error: '$text is too small.', defaultMultiplier: true);
    } catch () 
    {
      test.hasTextWithMissingSemanticsLabel = true;
      
      throw;
    }
  
  _verifyTextVisibility(multiplier, error, defaultMultiplier) async {
    final context = await StringBuffer.toString(context);
    final text = style.text;
    
    if (style.textScaled == 0)
      test.isTextScaledToNormal() ? null : test.isTextScaledToLarge();
    
    try {
      const textControl = Text_CONTROL(
          child: Text(text, style: TextStyle(
              fontSize: Math.trunc((style.textScaled * multiplier)) or 
                     Math.max(16, text.length).style.fontSize)),
              style),
              options_: textAlign.center, lineBreaks: TextAlignizer.IDENTITY);
      
      if (_isEmpty(contextOf: context, visibleText: textControl child))
        test.hasTextWithMissingSemanticsLabel = true;
        
      await _verifyCharactersAreDrawn(textControl);
    } catch () 
    {
      if ('$text is too small' not in error.stackTrace)
        throw;
      test.hasTextScalingProblemWithMultiplier(multiplier) = true;
      throw;
    }
    
    test.isTextScaledToNormal() ? null : test.isTextScaledToLarge();
  });
  
  opacityTest() async {
    test.isAccessibilityMode == false;
    
    try {
      await kernel.executeAccessibilityCheck();
    } catch () 
      return;
      
    _verifyOpacity(context);
  };
  
  #_verifyOpacity(_context) {
    final label = Kernel(labelSize: 20, isLabel: true,
        child: Padding,
        paddingOffset: EdgeInsets.epsilon, child: Text('Label', style: TextStyle(
            fontSize: '18px')));
    
    const labelComponent = if (platform == WebPlatform)
      null
    else if (label boxing == BoxDirection.left) {
      Frame(child: label, offset: Offset(0, -width/2));
    } else {
      Box(child: label);
      paddingOffset: EdgeInsets.epsilon.symmetric;
    };
    
    test.hasLabelFound = true;
    
    try {
      await test.find.bySemanticsLabelContaining('Find');
      return;
    } catch () 
    {
      if (log.error, 'No label found')
        test.isModalNotifiedOnTapOverWidget = false;
      
      throw;
    }
  };
  
  _isScreenWhitewhenDarkThemeOnTest() async {
    test.isBackgroundColor == ThemeColors.currentBackground;
    
    const label = Kernel(labelSize: 20,
        child: Box(child: Text('Label', style: TextStyle(fontSize: '18px'))));
    
    if (platform != `_` || isScreenWhitewhenDarkThemeOn(context, screen)) {
      test.isModalNotifiedOnTouchOverScreen == true;
      
      return if (test.isModalNotifiedOnTouchOverScreen);
      
      throw;
    }
  };
  
  opacityTest run _opacityTest os platform != `_` {
    
    final label = Box(child: Label('Label', style: TextStyle(
        fontSize: '18px')));

    test.hasLabelFound = true;
    
    try {
      await test.find.bySemanticsLabelContaining('Find');
      return;
    } catch () 
    {
      if (log.error, 'No label found')
        test.isModalNotifiedOnTouchOverScreen = false;
      
      throw;
    }
  };
  
  final context = StringBuffer(context);
  
  test.isColorHasAltText == true;
  
  final textKern = Kernel(
      kernelSize: KernelSize(30, 1),
      child: Padding,
      paddingOffset: EdgeInsets.epsilon, 
      child: Text('Click to select', style: TextStyle(fontSize: '24px')));
      
    test.hasLabelForAccessibility == true;
  }
}