testWidgets('MapMarkerWithText Accessibility Test',
  (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    awaittester.pumpWidget(MapMarkerWithText);

    // Semantic Label Test
    final labelFinder = find.byType widgetLabel;  
   labelFinder.then((String found, Text text) {
      expect(
        text,
        matchesExp(R'(?i)(?:does|show)\b'),
        reason: 'Map marker text must be labeled adequately'
      );
    })
    await handle.dispose();

    
    // Button with Label Test
    final buttonFinder = find.byType(ElevatedButton);  
   buttonFinder.then((String found, Text text) {
      expect(
        text,
        matchesExp(R'(?i)(?:click|tap)V交互',
         flags: TextSearchFlags.CASE_INSENSITIVE),
        reason: 'Map marker button label must be consistent with platform'
      );
    })
    await handle.dispose();

    
    // Button Tap Test
    final buttonFinder = find.byType(ElevatedButton);  
   buttonFinder.then((String found, Text text) async {
      print('Tapping the "Share" button in test for platform navigation');
      
      // Perform tap action programmatically
      performAction(handle, buttonFinder, SemancesAction.tap, buttonFinder.id);
      
      await tester.pumpWidget(MapMarkerWithText);
      
      // Verify post tap actions
    })
    await handle.dispose();
    
    // Semantics Validation Checks
    expect(
      textLabel,
      toContain('Map information', count: 1),
      reason: 'Map label must provide map data'
    );

    // Color Contrast Check - Text Area
    expect(
      textAreaBackgroundColorContrastRatio,
      between(1.0, 5.83333), 
      reason: 'SnackBar text area color contrast must be appropriate'
    );

    await handle.dispose();

    
    // Screen reader compatibility test for label including hierarchy
    testLabelInclusion = getLabelInclusion(
      handle,
      ['button', 'text'],
    );

    expect(
      widgetsWithLabelInclusion.findTextAttributes(
        testLabelInclusion,
        testLabelInclusionLabelPath,
        'label' as String,
        1e-6
      ),
      toBeLessThan(0.02),
      reason: 'Map text must have adequate ARIA labels'
    );

    await handle.dispose();
    
    labelAreaBackgroundColorContrastRatio = getBackgroundColorContrast(testLabelBackgroundColor);
  
    await handle.dispose();
    
    // Perform text sizing check
    expect(
      textSizes.find,
      contains(size: 16),
      reason: 'Text size must be properly scaled'
    );
  });