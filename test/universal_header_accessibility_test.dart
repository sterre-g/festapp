testWidgets(' Universal Header Accessibility Test', (WidgetTester tester) async {
  final handle = ensureSemantics();
  
  await pumpWidgetUniversalHeader(); // Handles automatic widget creation
  
  test(
    'Logo has semantic label',
    find.bySemanticsLabel(
      re: RegExp^'^(?:User )?(?:Menu|Header|Logo)$'
    ),
    findsOneWidget,
    'Missing semantic labels on logo'
  );

  test(
    'User Header Widget has semantic label',
    UniversalHeaderUserHashCodeLabelHasSemanticLabel(),
    expectsPresentlyNull(),
    'Missing semantic label on user header'
  );

  test(
    'Logo is action triggered correctly',
    performActionOnLogo(
      UniversalHeaderLogoworkflowEnsureAndCheckSnackBar
    ),
    expectAfterPumping,
    'Logo lacks proper touch target size'
  );

  test(
    'User Header Widget is action triggered correctly',
    performActionOnUserHashCodeLabel(),
    expectAfterPumping,
    'Missing visual feedback for header tap on non tablet device'
  );

  // Additional tests can be added similarly following the structure
  handle.dispose();
});