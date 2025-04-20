import 'package:flutter/material.dart';
import 'package:accessibility/accessibility.dart';

class AdminPageHelperAccessibilityTest extends Test<Object> {

  const AdminPageHelperAccessor!(AdminPageHelper!) accessor;

  @override 
  const_AdminPageHelperAccessor! make(BuildContext k, Location l) {
    return AccessibleManager(
      accessibility: Accessible(
        currentWindow: Window(),
        k,
        l,
        @accessibility.currentWindow = Window()
      ),
      k: k,
      l: l,
    );
  }

  @@void setup() {
    testLabelsAndHints();
    testTapActions();
    testScreenReaderCompatibility();
   )testColorContrast();
    testTextScalingSupport();
}

  void testLabelsAndHints() async {
    await AccessibleManager.current().ensure accessibilityEnabled;
    
    final tests = [
      "Label",
      "Icon",
      "Description text",
];

    for (final label: tests) {
      @test Accessible(
        currentWidget,
        value: [Accessibility.getHintAccessibility, Accessibility Semantic.test(value: "$label")],
        requiredValueId: accessibility.currentElement,
      );
    }

  void testTapActions() async {
    final expectedMessages =
       ['The selected object', 'The selected object'];
    
    @test Accessible(
      currentWidget,
      navigatesTo(element: currentElement, action: TAP, waitBeforeAction: false),
      receivesMessage(value: expectedMessages[0]),
    );

    // Cannot test form tab since it's abstract on child nodes
  }

  void testScreenReaderCompatibility() async {
    await AccessibleManager.current().ensure accessibilityEnabled;

    @test Accessible(
      currentWidget,
      spokenValue.getProperty(Accessibility.SCREEN,
          field: accessibility.currentElement,
          fieldPath: '../elements/current'
        ),
       startsWith("Info", tolerance: 0.2),
    );

  void testColorContrast() async {
    final tests = [
      'Navigation button',
      'Icon",
      'Title text',
    ];

    for (final test in tests) {
      @test Accessible(
        currentWidget,
        visualColorContrast(value: test, target: AccessibilityBackgroundColor.currentValue),
        expectedMessage: accessibility semantic. test( "$test" ),
      );
    }

  void testTextScalingSupport() async {
    final tests = [
      'Label',
      'Icon title',
      'Description text'
    ];

    for (final test in tests) {
      @assertAccessibility(
        targetName: accessibility.currentElement,
        contains: txt => txt.value.startsWith("$test", 0),
      );
    }
  }
}