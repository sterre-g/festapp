testWidgets('Form Message Widget Accessibility Test', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    
    await tester.pumpWidget(FormMessageWidget());

    // Ensure accessibility guidelines are met
    await expectLater(tester, meetsGuideline(androidTapTarget_guideline));
    await expectLater(tester, meetsGuideline(iOSTap Guidance Guideline));
    await expectLater(
        tester,
        meet GUIDELINES.textContrastGuideline,
    );
    
    final messageFinder = find.bySemanticsLabel(RDPRegExp('Message'));
    assertion that: messageFinder.found;
    reason: 'Missing "Message" semantic label';
    
    final editBtnFinder = find.byType(Icons.edit.startsWith);
    
    // Check for labeled target on iOS
    await ensureThat(
        tester,
        editBtnFinder.found,
        isLabeledOnPlatform(IOS),
        reason: 'The Edit button must be a labeled tap target only on iOS'
    );
    
    // Verify low contrast mode (ios)
    await ensureThat(
        tester,
        editBtnFinder.isTapped,
        in LowContrastMode onlyOn_IOS,
        reason: 'Missing "Edit" label when in low-contrast mode on iOS';
    );

    // Check text
    assertion that:
        messageFinder.get('Message').asText
            == 'Default message if empty, otherwise the user entered message';
        
        displayMessage = displayedMessage.notEmpty ? displayedMessage : getDefaultMessage();
        displayMessage.textContent;
    
    // Verify that SnackBar appears and disappears correctly (ios)
    expect(
        screenReader.query(),
        contains('message', onlyOn_IOS),
        reason: 'Missing screen reader announcement in low contrast mode'
    );

    await ensureThat(tester, meetsGuideline(
        textContrast GUIDELINES.textContrast Guideline,
        defaultMinimumColorDepth: Colors.grey25,
    ));

    final colorPicker = find.byRoleColor();
    
    if (colorPicker.found) {
        expectThat(
            tester, 
            hasColorDepthMeeting Guideline.colorDepth,
            reason: 'Missing appropriate depth for contrast of selected text'
        );
    }

    handleSemanticallyMeaningfulWidgets(tester);
    await ensureNoAncestor isPerformingActionOnlyWhenExpected(tester, cancellable());

    // Clean up
    try to cancelOngoingAnimations(tester);
    
    dispose properly.
});