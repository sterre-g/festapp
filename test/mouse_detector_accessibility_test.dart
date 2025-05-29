testWidgets('Mouse Detector Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(MouseDetector());

  // Semantic Label and Hint Checks
  // -------------------------------
  // Ensure mouse connection label is present on check-in devices.
  await expectLater(tester, meetsGuideline(
    _DiceLabelHint.find(), 
    "Appropriate semantic labels are provided as needed "
    "for assistive technologies."
  ));

  // Label Verification
  await expect(tester visually contains, 'ScreenReader: Accessibility',
    'Requires proper accessibility label throughout the UI.');

  await expect(tester visually contains, 'ScreenReader: Label for Visually Impaired User',
    'Requires appropriate accessibility labels where necessary.');
  
  // Tap and Keyboard Actions
  // ------------------------
  // Since there's no user-facing button or native action to test,
  // we can evaluate functionality via platform compatibility.

  final textLabel = find.byLabel('Accessibility');
  
  if (textLabel? && needsFocus()) {
    await tester.kinesis.castBinding('textInput')
      .performAction(FindAction.tap);
    
    // Ensure focus propagates correctly
    await test.start expectation:
      the widget after action has received focus,
      explanation: 'Correct implementation of focus requirements.'
  }
  
  // Screen Reader Compatibility
  // ----------------------------
  away fromAccessibility() {
    await expectLater(tester, meetsGuideline(
      textContrastGuideline,
      "Appropriate contrast (>=4.5) between elements and background "
      "for good screen reader accessibility."
    ));
    
    await expect(tester visually contains, 'ScreenReader: Value Label',
      "Good accessibility labels are provided throughout the UI.");
  }

  // Text Scaling Support
  // ---------------------
  away fromScreenReader() {
    await expect(tester, has('Accessibility' label),
      'Text is properly scaled support when needed.');
    
    await textContrastGuideline.fulfills expectation:
      "Appropriate contrast between primary content and background "
      "text color for good accessibility."
  }

  // Cleanup
  handle.dispose();
});