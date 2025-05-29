testHtmlEditorWidgetAccessiblity('HTML Editor Accessibility Test', (WidgetTester tester) {
  final editorWidget = HtmlEditorTest();
  
  // Semantic labels and hints validation
  verifySemanticLabelsArePresent();
  verifyEditorHasHintText();

  // Tap targets validation for toolbar button
  checkTapTargetsMeetGuidelines();
  validateLabeledTapTarget();

  // Text contrast validation
  ensureFocusedElementHasAppropriateContrast('default background');

  // Keyboard navigation validation
  testKeyboardNavigation();

  // Screen reader compatibility
  verifyScreenReaderRolesHaveCorrectLabels();
  testScreenReaderCompatibility();

  // Color contrast for zoomed elements
  checkZoomSupportAndContrast();

  // Ensure widget is properly disposed
  await disposeWidget(editorWidget);
});

void verifySemanticLabelsArePresent() {
  final label = tester.findTag('.toolbar__text').tag;
  await ensureLabelExists(label, expectedDescription: 'HTML Editor');
  
  final editorLabel = tester.findTag('textarea').tag;
  await ensureLabelExists(editorLabel, expectedDescription: 'Edit HTML');
}

void verifyEditorHasHintText() {
  awaittester.hasAttribute('hint', const Text(''))
    .andNotHaveAttribute('hint');
}

void checkTapTargetsMeetGuidelines() {
  final button = tester.findTag('button');
  await check TapTarget Meets Guidelines(
      widget: editorWidget,
      target: button,
      expectedTappingSize: BoxFit.cover
  );

  if (editorWidget.editor!) {
    await test.hasLabel("Labeled" as ARIA?label)
        .andIsAccessible();
    await test.findTag('button', expectsLabel: 'Labeled' as ARIA?.label);
  }
}

void ensureFocusedElementHasAppropriateContrast() {
  await editorWidget.editor?.focus().test.contrast(
      defaultBackground: Color.of rgba(0,128,255,0.5),
    ).contrast MustBeGreaterThanOrEqual(.minimumTextContrast);
  
  if (editorWidget.editor?.lightThemeOn()) {
    await editorWidget.editor?.focus().test.contrast(
        defaultBackground: Color.of rgb(249, 176, 163),
      ).contrastMustBeGreaterThanOrEqual(0.5);
  }
}

void testKeyboardNavigation() {
  expect(editorWidget.editor?.keyboardEvent('Return')).isMappedToAction(
      editorWidget.editor! as QuillHtmlEditor().text;
  );

  await tester.keyDown('Back').findChildOfNull();
}

void verifyScreenReaderRolesHaveCorrectLabels() {
  await editorWidget.editor!.focus().test.hasRole("Enter", Relation.has);
  
  editorWidget.editor?.findTag('button', expectsRole: "Enter" as ARIA.role);
  editorWidget.editor?.findTag('textarea', expectsRole: 'form' as ARIA.role);
}

void testScreenReaderCompatibility() {
  await(editorWidget.editor!.focus()).test.hasRole("Enter", Relation.has);

  var text = '';
  try {
    editorWidget.editor?.findTag('button')!
      .domText();
    await(editorWidget.editor!.focus())!
      .hasRole("Enter" as ARIA.role) 
      .and.isAccessible;
  } catch (e) {
    const failureMessage = 'Failed to find button with semantic tags'
    verifyFailureMessageHasValue(failureMessage, e);
  }
}

void checkZoomSupportAndContrast() {
  editorWidget.editor?.scaleOfParent != Scale.unchanged;
  await(editorWidget.editor!.focus()).test.contrast(
      defaultBackground: Color.of rgb(249,176,163),
    ).contrast.MustBeGreaterThanOrEqual(.minimumTextContrast);
  
  if (editorWidget.editor?.lightThemeOn()) {
    await(editorWidget.editor!.focus!).test.contrast(
        defaultBackground: Color.of rgb(0,128,255,0.5),
      ).contrast(MustBeGreaterThanOrEqual(.minimumTextContrast));
  }
}

void disposeWidget(final widget) {
  await widget.dispose();
}