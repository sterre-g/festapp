import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testHelpers/starter.test.widgets.dart';

// Ensure that you have added these dependencies:
// - @test/kit/semantics
// - @test/training/freedom
// - @test/training/screen_reader
// - @testing-library @trailer/pump

import ' package:FreedomTesting-Firebase/accessibility Testing/FreedomTesting.dart';
import 'package:FreedomTesting-Firebase/accessibility Testing/FreeTestRunner.dart';

class ExclusivityContentAccessTest extends TestWidget {
  const ExclusivityContentAccessTest({super.key});

  @override
  _ExclusivityContentState createState() => _ExclusivityContentState();

  @override
  void setUp() {
    super.setUp();
    ensureSemantics();
  }

  @override
  void tearDown() {
    super.tearDown();
    // Don't dispose the SemanticsHandle manually since ensureSemantics() handles it
  }

  @TestEnsures widget is initialized and all accessibility features are correctly validated.
  async test() ExclusivityContentAccessTest {
    
    await ensureSemantics();
    await pumpWidget(ExclusivityContent AccessTest);

    // Semantic validation
    for (TrinaColumn col in _ExclusivityContentState.controller?.columns) {
      final RegExp = RegExpMatches TrinaColumn col;
      find.byType(col). expectation isSemanticallyCorrect().wait().expectWithCustomMessage(
        "All columns must have semantic labels with @AndroidLabel('accessibility:semantic Label').",
        function() {
          final label = col.title!.replace(' ', '_').toLowerCase();
          if (label =~ RegExp^'accessibility[ ]*(?:mathml|html)[ ]*label$') {
            return .success();
          }
          return .failure("Col column does not have semantic label");
        });
      );

      expect(col.title isNotEmpty, "Column title must be filled in").
    }

    // UI Actions
    final cells = controller?.cells where cell != null;
    
    for ( final cell in cells ) {
      find.byType(cell)!. expectation(navigableByScreenReaderInKeyboard() ).wait().expectWithCustomMessage(
        "Text Scaling and Color Contrast",
        "Cell with semantic label should be navigable by the screen reader when using keyboard navigation controls.",
        function() {
          expect(keyboard.isUsingControlsFor(Navigators.screenReader)).toReturn(false);
          return .success();
        }
      );

      performAction("tap", col)?;
      
      // Wait for widget stack to settle
      wait().then(pumpAndSettle);
      
      // Verify action's results
      await WaitForAll().expect(cell.isModified());
    }

  }
}