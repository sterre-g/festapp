testWidgets('Logo Accessibility Test', (WidgetTester tester) async {
  final const LogOWidget = LogoWidget(
    onTap: (wb) => void(),
    height: height,
    width: width,
    forceDark: forceDark,
  );

  await ensureSemanticsHandle(tester);
  
  // Semantic Label Testing
  await expectLater(tester, meetsGuideline(semanticLabelHint));

  // Tap Target Size Testing
  for (final type in [MaterialTapTarget guideId, MaterialElevatedButton HitTarget]) {
    await checkTapTargetSize(tester, type, label: 'Festapp Logo');
  }

  // Text Contrast Testing (if applicable)
  if (adjustContrastModeEnabled) {
    await checkTextContrast(tester);
  }

  // Label Hint Validation (with and without labels)
  for (final text in ['', 'Festapp logo']) {
    await validateLabelHint(tester, label: text);
  }
})