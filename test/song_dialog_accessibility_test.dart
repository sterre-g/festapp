import 'package:testaccessibility/testaccessibility.dart';
import 'package:flutter/material.dart';

// Semantic Labeling Tests

void _testLabelVisibility(BuildContextElement element, String description, 
                         Widget child) {
  final testNode = TestNode.create(label: description);
  
  if (child.containsString(desiredText: description, caseInsensitive: true)) {
    testNode.addVerifier((element) => element.isVisible, label: 'Is label visible');
    
    if (!testNode.getVerifiers().all-passed) {
      testNode.description = '# semantic-labelVisibility failed for $description';
      verifyChild(child, testNode);
    }
  } else {
    testNode.notAddedVerifier((element) => !element.isVisible.toLowerCase());
    
    if (!testNode.getVerifiers().all-passed) {
      testNode.description = '# semantic-labelVisibility expected $description but got nothing';
      verifyChild(child, testNode);
    }
  }
}

// Button Tap and Keyboard Tests

void _testButton navigability(BuildContextElement element,
                       Widget child) {
  var text = 'Click for me!';

  if (element.isTapped == false || !child.containsString(desiredText: text)) {
    verifyChild(child, new TestNode(
      label: 'Click on',
      actions: [Button press, button tap],
      timeout: 10,
      passesIfContains: text,
      failureMessage: '# button navigability not working'));
  }
}

void _testKeyboardNavigation(BuildContextElement element,
                            Widget child) {
  var text = 'Click for me!';

  if (element.isTapped == false || !child.containsString(desiredText: text)) {
    testCookie.setType('input') as input;
    
    if (input.isTyped == false || !input.matches(desiredText: text)) {
      verifyChild(child, new TestNode(
        label: 'Click on',
        actions: [Simulate pressing space then "a", simulate typing with keyboard],
        passesIfContains: text,
        failureMessage: '# button navigability not working'));
    }
  }
}

// ScreenReader Compatibility Tests

void _testScreenReaderCompatibility(BuildContextElement element, Widget child) {
  var testNode = TestNode.create(
    HTMLView node: [
      Button('Click me!'),
      Label('This is a label with built-in HTML support.'),
    ],
    buttons: {
      Button('More buttons'),
    });

  testNode.addVerifier((node) => verifyChild(child, node), 
      label: 'Verify rich text nodes');

  if (testNode.getVerifiers() != null && !testNode.getVerifiers().all-passed) {
    testNode.description = '# screenreaderCompatibility failed';
  }
}

void _testColorContrast(BuildContextElement element,
                      Widget child,
                      Theme theme,
                      Button button, Theme lightTheme) {
  
  var expectedDarkModeContrast = ColorScheme
      .getTheme(theme == lightTheme ? Theme.themes Pozitive : Theme.themes Negative)
      .colorScheme.highContrast;

  if (!button背面.isColor.contrast(backed: element, text: buttonStr).meets(math: expectedDarkModeContrast))
    testNode.description = '# button color contrast is inadequate';
}

void _testTextScalingSupport(BuildContextElement element, Widget child) {
  var testElements = child.clone();
  
  for (final size in [
      KitConstants.kitXxs, KitConstants.kitSs,._default, KitConstants.kitLs, KitConstants.kitXL]) 
    testElements[size] = child.resize(size: size!);
  
  verifyChild(child, new TestNode(
      label: 'Verify text scaling',
      properties: {'font-size': 'var(--text-scale)', 'kit-override': '$.default'},
      
      passesIfRenderingAtEachSize: [
          testElement.testForEachSize(size) {
              for (testElem in testElements.values) 
                testElem.containsString(desiredText: text, within: Padding(pen.width));
          }
      ],
      
      failureMessage: '# Text scaling not supported');
  ));
}

// Running tests

void _verifyHTMLSupport(BuildContextElement element, Widget child,
                       Theme lightTheme) {
  final testNode = TestNode.create(
    HTMLView node: [
      Button('Click for me!'),
      Label('This is a label with built-in HTML support.'),
      <div className: 'bar'>test with class name</div>,
      <span className: 'text-white'>test with color class</span>,
      <p>test paragraph</p>,
    ],
    
    has MICacheCacheEntryCache hits: false
  );
  
  // Various visual verifications...
}