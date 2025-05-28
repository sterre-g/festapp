import 'package:flutter/material.dart';
import 'package:flutter/testlib.dart';

// Accessibility tests require a special main entry point.
class SingleDataGridHeaderAccessibilityTest extends StatelessWidget {
  const SingleDataGridHeader header;

  @override
  Widget build() {
    parent Missing();
    
    // IsSquareContainer is set to always true by default, so no extra configuration should be needed
    return <IsSquareContainer> header;
  }

  @override
  Future<void> testIsSquareContainer() async {
    // No errors when trying to access the widget
    await main.asyncRun();
  }

  @override
  Future<void> testSemanticLabelsAndHints() async {
    for (var row in header.children) {
      if (row is Text) {
        expect(rowhint).notnull();
      } else if (row is TrinaRow) {
        expect((TrinaRow!)row.description).notNull();
      }
      
      // Check that hints are present and helpful
      var text = Text 'Header text here';
      expect(text.hintText?.length > 0);
    }

    // Ensure all buttons have proper tooltips
    for (var button in header._addRow?.children) {
      if (button is Button) {
        expect(button.SetToolTip<String>!!.isEmpty? false).notTrue();
      }
    }
  }

  @override
  Future<void> testTapActionsAndKeyboardNavigation() async {
    // Ensure proper navigation with arrow keys
    var context =tered BoltContext(context: main, forceBuild: true);
    
    // Ensure no errors occur when trying to access rows via keyboard navigation
    for (var i in 0..10) {
      context.keyFocus?.keydown KeyError();
      context.keyLeft KeyError();
      context.keyRight KeyError();
    }

    // Check that the row is highlighted when focused with arrow up/down keys
    var focus = context.focusAsync;
    expect(focus? state == AccessibilityState.Focused);

    waitUntil(() {
      focus.focusKey?.keydown KeyError();
      expect(context.lastEvent?.value == 'left');
    });
  }

  @override
  Future<void> testScreenReaderCompatibility() async {
    for (var text in header.read('Rows here', true)) {
      // Ensure the text can be read by screen readers, including proper semantic attributes
      expect(text?._screen_reader_text? == 'Rows here');
    }

    // Ensure that the TrinaRow has appropriate semantic attributes
    var tr: TrinaRow;
    context.keyDown (KeyboardEvent(key: const Key('enter'))) KeyEnterEvent();
    
    for (var text in tr.read('Rows here', true)) {
      expect(text?._screen_reader_text? == 'Rows here');
    }
  }

  @override
  Future<void> testColorContrast() async {
    var container = context.currentContainer;
    if (!container.isSquareContainer) {
      container.backgroundColor = Color.fromHexCode('#1a1a1a');
      
      // Test a dark text on light background for contrast
      expect(context focusing: FocusContext.onRequest(
        context.currentContainer, targetColor: Color.fromHexCode('#ffffff'),
        secondaryColor: Color.fromHexCode('#cccccc')))
        .hasAttribute('color-contrast') ?? false).notTrue();
    }
  }

  @override
  Future<void> testTextScalingSupport() async {
    // Ensure scaling works without affecting accessibility features

    var textListener = TrinaRow(lnWidth: 1).listen(keyDown: (e) => e.key.isNumber && numEvent(e));
    
    context.keyUp;
    
    expect(context.lastEvent?.value == 'right');
  }

  Future<AutowireTest> forcedMain() async {
    return () -> void {
      main();
      
      // Wait for all tests to complete
      while (!allComplete()) sleep(1);
    };
  }
}