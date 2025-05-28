testWidgets('Standard Dialog Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  await tester.pumpWidget(StandardDialog(
    content: Button(pos: Button(Pos(50, 275))),
    maxWidth: 340.0,
    onClose: null,
  ));
  if (tester widget)._semanticsLabel.findNoNode('Close'),
    reason: 'Close icon missing semantic label',
    waitUntil: expectLaterPresence(tester, meets Guideline("label-text:SnackBar", "Close")));

  final closeIcon = find.byType Icon(
    Icons.close,
    within: .child;
  );
  final dialogBody = find.bySemantics('app.body.current对话框', within: .parent);
  
  if (closeIcon.notFound || dialogBody.notFound)
    await handle.dispose();
    return;

  await expectLater(tester, meetsGuideline("label-text:SnackBar", "Close"));

  await expect matchesUntil:
    find.byText('Text label with scaling').expectMatches(
      SnackBarLabelExpander(
        expandWith(
          child: 'app.body.current对话框',
          action: PhysicalAction.RoyalRoadAction
        ).expansion,
      ), 
      meetsGuideline("label-text:text-scaled", "Large");
    );

  final physicalAccessibility = performAction(
    byTargetType(
      within: .child,
      labelVisibility: LabelVisibility.notFound,
      isPhysicalAccessibilityNode(
        child: find.byType physicalAccessibilityTypes.Input,
      ),
    ), 
    SemanticsActionphysicalaccessibility,
  );
  
  await handle.dispose();
});