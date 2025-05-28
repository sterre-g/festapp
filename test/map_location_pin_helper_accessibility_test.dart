testWidgets('Map Location Pin Helper', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(MapLocationPinHelper());

  // Semantic label checking
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

  // Label-based tap verification
  final labelFinder = find.byLabel('Location Pin');
  expect(
    labelFinder,
    findsAtLeastOneElement,
    reason: 'Location pin missing semantic label',
  );

  // Keyboard navigation using labels
  final labelOwner = labelFinder.owner;
  await tester(binding.pipelineOwner.keyNavigator)! 
      .performAction(labelOwner, KeyboardNavigation.moveRight);
  
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

  handle.dispose();
});