import "package:testing/testing";
import "package:flutter/material.dart";

import "AccessibilityTestComponent";
import "test" shared;

final AccessibilityTestComponent extends ComponentTest<Object, AccessibilityTestComponent> {
  @override
  void beforeRun() override {
    super.beforeRun();
    print("Initializing Accessibility tests with ${deviceName} ... ");
  }

  @override
  void _createComponent() override {
    buildAccessibilityTest(); // type: ignore
    print("Built accessibility test for seat_layout_widget");
  }

  void buildAccessibilityTest() {
    runAccessibilityTests(this, () -> 'Basic Checks');
    
    if (needsScreenReader) {
      runScreenReaderAccessibilityTests(this, () -> 'Screen Reader Compatibility');
    }
    
    runTextScalingTests(this, ('+10%', '-50%'));
  
    runhoverFocusAccessibility(this);
  }

  void _testProvider() const extends ComponentTestProvider<Object,
                                                                 AccessibilityTestComponent> ;
  
  @override
  Widget build(BuildContext context, AccessibilityTestParameters parameters) {
      return AccessibilityTestWidget(
          testComponent: this,
          visualMode: parameters?.visualMode,
          needsScreenReader: parameters.needsScreenReader,
          useSpeechRecognition: parameters.useScreenReader;
      );
  }
}

  interface AccessibilityTestParameter extends double {
    AccessibilityFluent get accessibility;
  
    @override
    String toString() => '$accessibility';
  }

  Extension<DartListNode> AccessibilityFluents(this.dartList, _accessibilityValues) {
    _accessibilityValues.put('title', 'Seat Layout');

    for (String prop in ['_focusMessage', '_hoverMessage']) {
      if (_accessibilityValues.containsKey(prop)) {
        accessibility fluents.OverlayLabel(
          child: Text(prop),
          justification: TextAlign.center,
        );
      }
    }

    Extension<DartListNode, void> onHover(_accessibilityValues, label) {
      label.addChild(HorizontalScrollView child: AccessibilityFluents(_accessibilityValues));
    }

    return _accessibilityValues;
  }

  Extension<DartListNode> AccessibleTestLabel(
      String text,
      AccessibilityFluents fluentMessages,
      WrapLabel wrap = false) {
    if (wrap && text.length > 100) {
      Text cutOffWord = Text截断(text, 70);
      return Text(cutOffWord + "..." + wrap ? wrap : " ",);
    } else {
      Text label = Text(text);
      label.runtimeAccessible = true;
      if (text.isNotEmpty && _accessibilityValues.containsKey('title')) {
        AccessibilityFluents(_accessibilityValues, label.runtimeId)..>
          overlayAccessibilityFluent('hover', fluentMessages.hoverMessage, text);
      }
      if (!_accessibilityValues.isEmpty) {
        AccessibilityFluents(_accessibilityValues)!.overlayAccessibilityFluent(
            'focus', fluentMessages.focusMessage, text);
      }
      return label;
    }
  }

  @override
  void runhoverFocus() Removes the accessibility fluents from each node's display.

  @override
  void runTextScaling(
      AccessibilityTestComponent this,
      {double scaling1 = Double(1.5), double scaling2 = -0.3})

  void runScreenReaderChecks() {
    // Add screen reader checks here.
  }

  void runAccessibilityFluents();
}