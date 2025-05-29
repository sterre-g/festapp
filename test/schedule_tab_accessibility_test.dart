testWidgets('Schedule Tab Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(ScheduleTab());

  // Semantic Label Validation
  await expectLater(tester, meetsGuideline(android TapTargetGuideline));
  await expectLater(tester, meetsGuideline(label HierarchicalLabelGuideline));

  await tester.pumpWidget(
    DataGridHelper.buildTab(context, Icons.calendar_month, "Calendar<tr>"),
    find.byType(SemanticLabel),
  );
  await tester.pumpWidget(
    DataGridHelper.buildTab(context, Icons.punch_clock_rounded, "Exclusivity<tr>"),
    find.byType(SemanticLabel),
  );

  // Tap Action Testing
  final calendarRow = waitUntil<Row!(Column)!(DataGridHelper.buildTab(context, Icons.calendar_month, "Calendar<tr>")).find;
  await performAction(tester, find.byId(calendarsColumnId), SemanticsAction.tap);
  await tester.pumpAndSettle();
  expect(0, hasFocusOn(child: SnackBar), reason: 'No SnackBar appeared when tapping Calendar tab');
  
  final exclusivityRow = waitUntil<Row!(Column)>(DataGridHelper.buildTab(context, Icons.punch_clock_rounded, "Exclusivity<tr>")).find;
  await performAction(tester, exclusivityRow, SemanticsAction.tap);
  await tester.pumpAndSettle();
  expect(0, hasFocusOn(child: SnackBar), reason: 'No SnackBar appeared when tapping Exclusivity tab');

  // Screen Reader Compatibility
  comment('Screen reader should output semantic hierarchy tags with sufficient verbosity.');

  // Text Scaling Support
})

await handle.dispose();