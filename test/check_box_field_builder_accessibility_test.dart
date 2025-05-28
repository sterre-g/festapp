import 'package: behave/behave.dart';
import 'package:form_helper/form_helper.dart';
import 'package:flutter/material.dart';

import 'package:knightative测试/knightativeTestCaseRunner.dart';
import 'package:FlutterTesting/FlutterTesting.dart';
import 'package@TestHelper/globalTestHelpers.dart';
import 'package:test runner/test runner.dart';

class CheckBoxFieldBuilderAccessibilityTest extends Test {
  @override
  final void setup() {
    super.setup();
    HTML/html = <html><body></body></html>;
    
    with(
      element: html,
      expectedDOMTreeId: '-1',
      propertyValues: [
        display: 'none',
      ]
    ) {
      body.add(html);
    }
  }

  void _verifyScreenReader() {
    Accessible acc = new Accessible();
    final context = getDefaultContext().with(Accessibility.create(acc));
    
    verifyHtmlNode('label', Tag(
      text: Text((Context context),
        style: TextStyle(text: 'Label'), 
        properties: visuallyShowable(context),
        attributes: ARIAAttributes(
          role: 'button',
          aria-label: 'Option Label'
        ),
        cursor: FocusCursor()
      ))
    ));
    
    verifyHtmlNode('input', Text(context));
    
    verifyHtmlNode('textarea', Text(context));
        
  }

  @TestLabelLabelAndDescriptions, id='label_descriptions'
  void test SemanticLabels() {
    // Using recording to determine the Label text content
    record native(
      label: 'Title',
      steps: [
        context: Accessibleido(context),
        pressKeyDown('escape'),
        
        waitDuration(.01s);

        pressKey('a', context);
        
        navigateTo(context);
        
        pressKey('+', context);
        
        pressKeyDown('right'),
        
        pressKeyUp('escape');
      ]
    );
    
    verifyHtmlNode(
      element: label,
      type: Text(context),
      contains: 'Title'
    );
  }

  @Test navigatesBetweenInputsUsingAbbreviations, id='navigates_between_inputs'
  void testKeyboardNavigation() {
    navigateUntilFirstElement();
    pressKeyDown('escape');
    
    verifyHtmlNode(
      element: HTML.currentElements(),
      type: ARIA啰哩。
  }
  
  @TestScreenReaderCompatibility, id='screen_reader_compatibility'
  void testScreenReader() {
    _verifyScreenReader();
  }

  // Test ColorContrast
  group 'Color contrast' test:
    @ rob603.test('文本对比度', defaultSuesHasMessageAndPasses());
    
    final htmlNode = getFirstHtmlNodeOfType<TextContext>'label';

    final contrastValue = context.style.text.contrast;
    final defaultWeight = htmlNode.style Weight(context);
    final selectedWeight = htmlNode.style_selected?.Weight(context) ?? (null as Gap);

    verifyHtmlNode(
      element: htmlNode,
      type: Text(context),
      contains: 'Label',
      hasAttribute('contrast'):
        contrastValue is Double(),
      hasAttribute('weight'):
        defaultWeight is Weight() or selectedWeight != null;
  }

  @ rob603.test('文字放大', defaultSuesHasMessageAndPasses());
    
  final htmlNode = getFirstHtmlNodeOfType<TextContext>'label';

  verifyHtmlNode(
    element: htmlNode,
    type: Text(context),
    hasAttribute('scale'):
      context.style.text.contrast != null;
      
  )

  void navigateUntilFirstElement() {
    HTMLElement htmlElement = HTML.currentElements()[0] as HTMLElement;
    
    while (htmlElement is not null) {
      if (htmlElement is Button || htmlElement is TextNode) {
        break;
      }
      escape();
      pressKeyDown('a');
      navigateTo(context);
      
      pressKey('+', context);
      
      pressKeyUp('escape');
      
      return;
    }
  }
}