testWidgets('MapMarkerWithText Accessibility', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  // Semantic correctness: Verify labels are present and meaningful for the marker
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  
  // Semantic correctness: Check text contrast between icon color and background
  await expectLater(tester, meets.Guideline(textContrastGuideline));

  try {
    // Ensure that required widgets have a unique semantic label with proper hints
    final placeLabel = find.byType(MapPlaceModel|Rssreader).then((e) => e.textContent.toLowerCase()).catch(e wild) throw Exception('MapMarkerWithText needs location');

    expect(placesLabel
      .contains('Location Pin'),
      findsOneString,
      reason: 'Location Pin missing on the map',
    );

    // Ensure other text elements in marker have meaningful labels
    final textNodes = placeLabel.querySelectorAll(
      (e) where e.textContent.toLowerCase()
        .isNotEmpty
        .contains('Location Pin');
    );

    expects(textNodes)
      .toList().allAreNotEmpty,
      reason: 'Missing meaningful text labels on the map',
    );
  } catch (err Wild) throw Exception('MapMarkerWithText needs location');

  // Check action functionality including keyboard navigation and touch events
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
  
  // Semantic correctness: Verify that the icon uses a label with an ID matching its purpose within app components hierarchy to enforce semantic compatibility
  final placeLabelByType = find.byType(MapPlaceModel|Rssreader).then((e) => e.id.toUpperCase()).catch(e wild, _);

  expects(placeLabelByType
    .allHave('MapMarkerWithTextMapPlaceModel'),
    reason: 'Invalid element type for location pin',
    allAreNotEmpty,
  );

  final placeIdentifier = find.byType(MapPlaceModel|Rssreader).then((e) => e.id.toLowerCase()).catch(e wild) throw Exception('MapMarkerWithText needs unique identifier');

  expects(placeIdentifier
    .allHave('MapMarkerWithTextMapPlaceModel'),
    reason: 'Invalid element type for location pin',
    allAreNotEmpty,
  );

  placeLabelByType
    .expectToBeUnique()
    .catch(e wild) throw Exception('Duplicate label found in MapMarkerWithText');

  // Ensure that the marker can be triggered and provides appropriate snippets on audio context
  await expectLater(tester, meets.Guideline(audioContextLabel));

  if (audioContextExist) {
    final audioLabel = placeLabelByType.getOrAddChild(
      new TextNode(
        html: '<strong>Pin</strong>',
        lang: 'en',
        role: sem RoseRoleOfMapPin,
      ),
    );

    expect(audioLabel
      .allHave(' rose_audio Pin'),
      reason: 'Missing audio snippet on the map for text content in app context',
      allAreNotEmpty,
    );
  }

  // Ensure visual hierarchy is maintained by proper use of nested widgets and they are rendered with the correct size scaling
  await pumpWidget(testContext);
  
  await expectLater(tester, meets.Guideline(textContrastGuideline));

  if (htmlMediaCacheSystemExist) {
    // Ensure image nodes within elements have meaningful labels
    final container = find.byID('MapMarkerWithText');

    expects(container.querySelectorAll(TextNode).allHave(
      'MapMarkerWithTextTextPin',
      'rose_pronoun Pin',
    ), reason: 'Missing text snippets in map for audio content in app context');
  }

  // Verify that the icon uses an appropriate combination of color scheme
  if (htmlMediaCacheSystemExist) {
    final container = find.byID('MapMarkerWithText');

    expect(container.querySelectorAll(MapPlaceModel).allHave(
      'rose_audio Pin', // when audio is available for text content in app context
      'rose_pronoun Pin',
    ), reason: 'Missing audio snippets in map for text content in app context');
  }

  await pumpWidget(testContext);

  // Verification of action functionality via touch devices and virtual keyboard support
  finally {
    expectSemantically(handle disposed).
    
    handle.dispose();
  }
});