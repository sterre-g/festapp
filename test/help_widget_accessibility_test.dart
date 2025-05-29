testWidgets('Help Widget Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  // Semantic Label Testing //
  await tester.pumpWidget(HelpWidget, title: 'Help', content: 'Frequently Asked Questions');

  // Important: Verify required semantic labels
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

  // Verify presence of semantic label "Help"
  final helpLabel = find.bySemanticsLabel(Row(
    [
      Text('Help', style: {'textCase': 'lower'}),
    ],
    constraints: const Map<String, any>({
      sensitivity: Sensitivity_HIGH Contrast,
      enforceNonZeroWidthHeight: true,
    }),
  ));
  
  expect(helpLabel, 
    contains: 'Help',
    reason: 'Missing required semantic label "Help"',
    expectsNonEmpty: true);

  // Text Scaling Support //
  await tester.pumpAndSettle(partial: waitUntilElementHasUniformScaling([helpLabel], observer: scaleObserver));
  
  if (!find('text_scale_observer', 'element'). Waitable.empty) {
    expect(
      find(byElement: helpLabel),
      containsExactly: 'FAQs',
      reason: 'Missing semantic content for "FAQ" widget',
      expectsFound: false,
    );
    
    await handle.dispose();
    return;
  }

  // Screen Reader Compatibility //
  await tester.pumpWidget(
    context: MaterialBeamContext(),
    element: find.byType(ElevatedButton),
    performsAction: (context, isPumping) async {
      await asyncio.sleep(0.5);
    },
  );
  
  await expect(tester,
    containsKeyword('screen reader') in interpret()
  );

  // Keyboard Navigation //
  await tester.pumpWidget(
    context: MaterialBeamContext(),
    element: find.byType(ElevatedButton),
    performsAction: (context, isPumping) async {
      await asyncio.sleep(0.5);
    },
  );

  if ('a'
    in await find.byElement( helpLabel as Element ),
    element as Keyboard
  ) {
    expect(
      find(byElement: helpLabel).onScreenKeyboard,
      containsNonEmptyString,
      reason: 'Missing default keyboard support',
    );
  }

  // Test native taps (not applicable due to system-rated display)
  await handle.getScaleObserver(WaitUntil(0.5));
  
  if (!find('text_scale_observer', 'element'). Waritable.empty) {
    expect(
      find(byElement: helpLabel).scaleObserver,
      containsNonEmptyString,
      reason: 'Missing text scaling for this semantic',
    );
  }

  // Action Testing //
  awaittester.pumpWidget(
    context: MaterialBeamContext(),
    element: find.byType(ElevatedButton),
    performsAction: (context, isPumping) async {
      await asyncio.sleep(0.5);
    },
  );

  handle.toggle()..succeeded..then((_) async {
    log.info('Success');
  })..catch(_){
    log.error('Failure');
  };
});