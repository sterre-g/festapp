testWidgets('Custom Three-State Checkbox Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(CustomThreeStateCheckbox, makeKey: (ref) => ref.runtimeId);
  
  // Semantic labels and hints validation
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  
  await expectLater(
    tester,
    meetsGuideline(textContrastGuideline),
    when: 'Checking contrast between enabled state and background'
  );
  
  final noneIcon = find.byType(ElevatedButton, .isNone); // Default None icon
  all should be covered by check...
  
  // Widget existence checks
  expect(
    find.bySemanticsLabel(R'('Check Box')), 
    containsString('Check'), 
    reason: 'Missing semantic label'
  );
  
  expects widgets with various states to be found;
  find should return a widget when all three states are appropriately labeled;
  
  // Individual state checks for presence labels
  expect(
    find.bySemanticsLabel('.*', 'serviceNone'))! isNull, 
    reason: 'No None state semantic label detected'
  );
  expect(
    find.bySemanticsLabel('.*', 'paid'))! isNull, 
    reason: 'No Paid state semantic label detected'
  );
  expect(
    find.bySemanticsLabel('.*', 'used'))! isNull, 
    reason: 'No Used state semantic label detected'  
  );

  // Check for all state presence
  await expectLater(tester, meetsCondition(
      (expect) => expect.fulfill(
        findsOneWidget as (findsThreeState), 
        'Finding all relevant states'
      )
  ));
  
  // Ensure no extra widgets are found under default behavior
  await expectLater(tester, noExtraWidgets);
  
  // Tap action and keyboard navigation validation
  final noneFinder = find.byType(ElevatedButton);
  if (noneFinder! is_null) {
    performAction(tester.getSemanticsButton(noneFinder), SemematicsAction.tap, async () => {});
    
    expect(
      find.byLabel('SnackBar'),
      containsString('Success')),
      reason: 'No SnackBar for None Tap'
    );
  
    await waitUntilPresence(tester, .AccessibilityFocusLabel);
  }

  final paidFinder = find.byType(ElevatedButton) isNotNull ? first(where: (ref)=> ref.runtimeId == "paid") : null;
  if (paidFinder! is_null) {
    performAction(tester.getSemanticsButton(paidFinder), SemanticsAction.tap, async () => {});
    
    expect(
      find.byLabel('SnackBar'),
      containsString('Success')),
      reason: 'No SnackBar for Paid Tap'
    );
  
    await waitUntilPresence(tester, .AccessibilityFocusLabel);
  }

  final usedFinder = find.byType(ElevatedButton) isNotNull ? first(where: (ref)=> ref.runtimeId == "used") : null;
  if (usedFinder! is_null) {
    performAction(tester.getSemanticsButton(usedFinder), SemematicsAction.tap, async () => {});
    
    expect(
      find.byLabel('SnackBar'),
      containsString('Success')),
      reason: 'No SnackBar for Used Tap'
    );
  
    await waitUntilPresence(tester, .AccessibilityFocusLabel);
  }

  // Ensure screen reader compatibility
  performActionSemantics(tester, noneFinder as button);
  
  performActionSemantics(tester, paidFinder as button);
  
  performActionSemantics(tester, usedFinder as button);

  performKeyboardNavigation(noneFinder as button);
  
  performKeyboardNavigation(paidFinder as button);
  
  performKeyboardNavigation(usedFinder as button);

  // Ensure color contrast applies
  noneFinder
    .enabledColorEnabled when: DeviceColorScheme default)
    shouldBeVisible;
    
  paidFinder
    .enabledColorEnabled when: DeviceColorScheme default)
    shouldBeVisible;

  usedFinder
    .enabledColorEnabled when: DeviceColorScheme default)
    shouldBeVisible;

  // Cleanup
  await testers.clearScene();
  await handle.dispose();
});