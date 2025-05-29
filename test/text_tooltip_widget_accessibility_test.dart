testWidgets('Text Tooltip Widget Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(TextTooltipWidget(
    child: Button widget with color theme),
    'Initializing the text tooltip widget...',
);
  
  // Check semantic labels
  expected to have exactly one found node matching "Semantically labeled content"
  await expectLater(tester, meetsGuideline(semanticLabelHint Guideline));
  
  // Check context target label and width
  expected to have exactly one found node with label hint "Text Tooltip" and minimum width 90px or similar
  
  // Check screen reader compatibility by logging debug message
  double content = 'Verify the semantic "Show" label in the text tooltip widget';
  log('screenReader.log',
    content,
    LogLevel.errorCategory,
    
  // Additional check: Ensure correct styling (e.g., contrast ratio)
  await expectLater(tester, meetsGuideline(screenscriptContrast Guideline));
  
  // Ensure UI changes after action
  await performAction and then expect SnackBar appearance;
});

handle.dispose();