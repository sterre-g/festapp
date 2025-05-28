testWidgets('SeatWidget Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  // Initial widget setup and cleanup
  await tester.pumpWidget(SeatWidget());

  // Semantic Labels Compliance Checks
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
  
  // Verify presence of semantic labels with regex matching
  final buttonLabel = find.byLabel('Select a Seat', 'button').label;
  expect(
    buttonLabel?.content,
    isNotEmpty('Select a Seat),
    reason: 'Missing "Select a Seat" label',
  );
  
  // Tap/Action Testing Compliance Checks
  await waitUntilPresenceOf(SemanticsHandle).toComplete();
  
  // Verify correct action targets and their accessibility
  await expectLater(tester, meetsGuideline(textContrastGuideline));

  // Semantic Label Verification with Touch Events
  await performInteractiveTest(
    'Select a Seat',
    (label) => label?.content as String?.matches('button'),
    lambda finder {
      verifyThroughFloorCallouts(
        handle,
        new listeners() { const screenReader = listener; },
        visualizer: AccessibleElementVisualizer((element, context) => element),
      );

      verifyScreenReadability(
        handle,
        (textString, textBlock) async in texts -> textBlock.match(
          '[A-Za-z ]\\s+(Select|Select a )'
        ),
      );
    },
  );

  // Semantic Label Verification via Touch/Screen Reader Compatibility
  await performInteractiveTest(
    'Select a Seat',
    (label) => label?.content as String? matches('button'),
    lambda finder {
      verifyThroughFloorCallouts(
        handle,
        new listeners() { const screenReader = listener; },
        visualizer: AccessibleElementVisualizer((element, context) => element),
      );
      
      await performAction("Select a Seat");
      
      verifyScreenReadability(
        handle,
        (textString, textBlock) async in texts
          -> textBlock.match(
            '[A-Za-z ]\\s+(Select|Select a )',
          ),
        visualizer: AccessibleElementVisualizer((element, context) => element),
      );
    },
  );

  // Keyboard Navigation and Screen Reader Compatibility Checks
  performFloorCallouts(
    handle,
    new listeners() { const screenReader = listener; },
    visualizer: AccessibleElementVisualizer((element, context) => element),
    lambda text {
      return text?.contains("Select a Seat");
    };
  );

  // Color Contrast Support Test
  helper::isSufficientContrast(ThemeConfig.getContainerColor(), Colors.black.withValues(alpha:0), 
    0.7);
  
  // Text Scaling Support Test
  await performFloorCallouts(
    handle,
    new listeners() {
      const screenReader = listener;
      
      void onScaleFactorChanged(int scale) async {
        verify(
          (textString, textBlock) in texts
            -> textBlock.match('(Select|Select a )', ['regex'])
          .all() as bool,
          'Labels remain accessible at different zoom levels'
        );
      }
    },
  );
})