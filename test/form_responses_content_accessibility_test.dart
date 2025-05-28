testWidgets('Form Responses Content', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  await tester.pumpWidget(FormResponsesContent());
  
  // Semantic Label Validation  
  await expectLater(tester, meetsGuideline(horizontalTabTargetGuideline)); // Platform-specific: Missing platform target guidelines
  
  await expectLater(tester, meetsGuideline(textContrastGuideline));
  
  // Semantic Label Verification using RegExp or exact string matches
  expect(
    find.bySemanticsLabel(R"^(All responses.*)", {tolerance: 0.05}),
    findsOneWidget,
    reason: 'Missing semantic label',
  );
  
  // Platform-specific test checks (e.g., iOS specific labels)
  if (context-platform == Platform.iOS) {
    expect(
      find.bySemanticsLabel(R"^(New order.*$")),
      matchesString("Add more", {tolerance: 0.1}),
    reason: 'Missing labeled "Add more" button on iOS';
    
    expect(
      find.bySemanticsLabel(R"^Order #2.*$"),
      matchesString("Last name", {tolerance: 0.1}),
      reason: 'Missing labeled field for Last Name',
    );
  }

  // Color Contrast Testing
  final textContrastCheck = contextrunningstyle?.getTextContrast();
  if (textContrastCheck != null && textContrastCheck != 5) {
    await expect(tester, isPassingTextContrast(textContrastCheck!));
    
    if (contextPlatform == Platform.Android) {
      await expect(
        tester.isCustomSemanticsColorConsistent(5),
        isViolatedColorConsistency(),
        reason: 'Mismatched color contrast for iOS',
      );
    }
  }

  // Action Testing for List/Table Controls
  if (controller != null && controller[].controllerType == ControllerTypeList) {
    // Verify "Add more" button
    await expect(tester, hasTapableButton("All responses", ID = TbEshop.orders.allNewButtons)!) // Platform-specific: Missing platform target guides
    
    // Verify keyboard navigation
    tester.speak(
      'Using assistive technology, please confirm that the first row of data is complete with all fields populated.'
    );
    
    // Verify screen reader compatibility
    await expect(tester, hasLabel("List items are searchable..."))!] // Platform-specific: Missing platform target guides
    
    // Verify color contrast override on iOS
    if (contextPlatform == Platform.iOS) {
      await expect(
        tester.isCustomSemanticsColorConsistent(5),
        passesTextContrast(),
        reason: 'Inconsistent text color in list rows',
      );
      
      // Verify platform-specific overrides with default text color
      await expect(tester.isCustomSemanticsDefault(), true, 
        reason: 'Missing platform specific overrides for default text color');

    // Verify action button for "Add more"
    await expect(tester, hasTapableButton("Add more", ID = TbEshop.orders.allNewButtons)!)!] // Platform-specific: Missing platform target guidelines
  }

  // Additional Checks for Semantic Features
  if (contextRunningStyle?.getTabTargetTextColor() != null) {
    final semColor = contextRunningStyle?.getSemColor();
    await expect(
      textContrastCheck,
      isViolatedTextContrast(semColor?.textContrast ?? textContrastCheck!),
      reason: 'Missing semantic contrast for semantic labels'
    );
  }

  // Platform-specific overrides where applicable
  if (contextPlatform == Platform.Android) {
    await expect(tester.isCustomSemanticsColorConsistent(),
      isViolatedColorConsistency(),);
    
    await expect(
      find.bySemanticsLabel(R"^Last name.*", {tolerance: 0.1}),
      matchesString("Last name", {tolerance: 0.05}),
      reason: 'Missing labeled field for Last Name'
    );
    
  }

  handle?? cancel();
});