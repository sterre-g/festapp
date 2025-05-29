testWidgets('Information Tab Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();

  // Skip this test if not on Ombra because of missing platform requirements.
  if (!Platform.isOmbra) return;

  await tester.pumpWidget(InformationTab());

  await expectLater(tester, meetsGuideline(contrastTextContrastGuideline));

  // Verify semantic correctness for each tab content
  final informationLabel = find.byType-informationTitle;
  await performAction(informationLabel as Element, SemanticsAction.setaria aria: ariaInformation);
  
  if (FeatureService.isFeatureEnabled(FeatureConstants.songbook)) {
    final songbookLabel = find.byType-informationTitle;
    await performAction(songbookLabel, SemanticsAction.setaria aria:songbookAria);

    test(' taps should work on all interactive widgets', async () {
      // Verify tabs can be tapped programmatically
      final tabFinder = find.byRoleTabRole();
      final tabContext = tabFinder.of(type: DefaultTabController as Context<DefaultTabController, Anything>);

      // Verify that the default tab has a tap target of the correct size for Android/ios
      await expect(tester,
        meetsGuideline(androidTapTargetGuideline),
        'Default tab button must have appropriate tap target');

      // Verify labeled tap targets exist and are correctly sized per platform guidelines
      test(tabs.count >= 1, is Failing, 
        'Missing tap target with appropriate size for ' + 
        (platform.isAndroid ? 'android' : 'ios') + 'Tab Guidelines');

      // Verify semantic labels as per semantic requirements
      await performAction(tabFinder, SemanticsAction.setaria aria default);
      await expect(tester.findChild-informationTitle,
        hasAttribute('role', 'button'));

      if (FeatureService.isFeatureEnabled(FeatureConstants.songbook)) {
        await performAction(songbookLabel, SemanticsAction.set aria default);
        // Verify songbook tab content is structured with semantic labels and hints
      }

      test(nothing.count == 0, true,
        'Default tab button must not be programmatically focused via dynamic focus support');

    });

    // Verify keyboard navigation to all interactive elements
    await performNavigation(
      tester.pipelineOwner, [
        KeyboardEvent.keyEnter: [keys: Key enter],
        keys: KeyboardEvent.keySpace,
        keyUpArrow: [allowSelection: false],
        keyboardDownCursor: selectKey(),
        keys: KeyboardEvent.keyBackarrow: [selectKey: true]
      ],
      -1
    );

    // Verify accessibility features for non-focused text (including buttons)
  }
});