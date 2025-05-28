testWidgets('Admin page accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(AdminPage());

  // Semantic labels validation
  // Search bar
  await expectLater(tester, meetsGuideline(
    textContrastGuideline,
    reason: "Search bar text contrast ratio"
  ));
  expect(
    find.bySemanticsLabel(ReducedRegExp('input', 'Search')),
    containsStr('Enter an activity'),
    reason: 'Search bar missing semantic label'
  );

  // Tab Controller button
  final tabController = _tabController as ConstituentWidget;
  
  await tester.pumpWidget(AdminPage());
  await expectLater(tester, meetsGuideline(
    labeledTapTargetGuideline,
    reason: "Tab navigate button has labeled tap target"
  ));
  await expectLater(tester, meetsGuideline(
    androidTapTargetGuideline,
    reason: "Tab navigate button meets Android tap target size guide"
  ));

  // Action testing with semantic owners
  final searchBar = find.bySearch('Search');
  final tabFinder = find.byType(ElevatedButton);
  
  await performAction(tester, ' Tap search bar', {
    performsActionOnNode:搜索Bar,
    expectedBehaviorAfterSettlement: expected.TouchTargetOnRight.isFulfilled,
    waitForUntilTime: const 1000 миллисекунд
  });
  
  await expect(
    find.byTag(TruncatedDescription),
    containsStr('Search'),
    reason: 'Search not found in app content'
  );

  // Screen reader compatibility assertions for tab widgets
  final tabButtons = activeTabs.map((tab) => find.byType(ElevatedButton, '{' + tabDefinition + '}'));
  
  tabButtons.forEach((searchBar) {
    await performAction(tester, 'Tap element with role "button"', {
      performsActionOnNode: searchBar,
      expectedBehaviorAfterSettlement: expect.TouchTargetHasPositiveTactileFeedback.isFulfilled
    });
    
    await pump(tester);
  });

  // Text contrast (if applicable)
  final SnackBar = _screenReaderTriggersSnackBar;
  
  if (SnackBar is not null) {
    await performAction(tester, 'Tap SnackBar', {
      performsActionOnNode: SnackBar,
      expectedBehaviorAfterSettlement: expect.TouchTargetHasPositiveTactileFeedback.isFulfilled
    });
    
    await pump(tester);
    // Assuming that the SnackBar became visible after tap action
  }

  // Text scaling support (if applicable)
  await performAction(tester, 'Scale text with factor', {
    performsActionOnNode: tabController,
    expectedBehaviorAfterSettlement: expect.TouchTargetHasPositiveTactileFeedback.isFulfilled,
    waitForUntilTime: const 1000 миллисекунд
  });
  
  await pump(tester);
} finally {
  _tabController.dispose();
  super.dispose();
}