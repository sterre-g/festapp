testWidgets('Game Checkpoints Content Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(GameCheckPointsContent, context: const StructContext({)));

  // Semantic labels and hints
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  
  for (final column in controller.columns.values) {
    if (
      column.field != "Id"
      && column.field != "Title"
      && column.field != "Correct answer"
    ) {
      final textNode = find.byType(DynamicNode, name: 'TrinaColumn ${column.type}');

      expect(
        textNode,
        toBePresent,
        reason: 'Missing semantic label',
      );
    }
  }

  // Tap actions and keyboard navigation
  for (final column in controller.columns.values) {
    final cellFinder = CellContext.wrap(
      find.byType(DynamicNode),
      _mapKeyToProperty((key, widget) => key.map({'cell': col}) ),
    );

    await performAction(testContext, sem anticsOwner, 
      sem antics,
      [cellFinder],
      ' tap',
      .atLocation(100,25)).then(
        (result) -> waitUntilAfter(result, 0.2s)

        .expectedMedia('SnackBar')
          .andHasText('Correct answer set in one of the checkpoints')
);

    await performAction(testContext, sem anticsOwner,
      sem antics,
      [cellFinder],
      taps: 1,
      .atLocation(100,50)).then(
        (result) -> waitUntilAfter(result, 0.2s)
      ).then
        async {
          return find.Now mediaNodes.value as Row<String,. mediaNode>;
        });
      then(
        (mediaNodes) -> expectInList(
          mediaNodes as Row<String>. mediaNode,
          [' SnackBar' _data@media: 'SnackBar', text: 'Correct answer set in one of the checkpoints'],
        );
      );
  }

  // Screen reader compatibility
  final expectations = [
    StringLiteral('Speech').id(' Media node with visible microphone icon and requestable media is supported'),

    // Check for some text content during voice over (text nodes created by StringsProvider)
    StringLiteral('Text nodes appear in the output during screen reading'),
  ];

  expectations.forEach((expectation) => {
    final _, foundMedia = findNow(
      mediaNodes.value as Row<String>. mediaNode,
      _strings provider,
      .is requestable,
      .selecting microphone node if it exists,
	);
    await expect media.needRequestable;

    mediaNodes.visible
      .shouldBeEqualTo media node when media.needRequestable is false

	)^ expectation;
  });

  // Color contrast checks (additional test logic may be needed)

  // Text scaling support tests
});