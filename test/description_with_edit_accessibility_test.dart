testWidgets('DescriptionWithEdit Accessibility Tests',
  (WidgetTester tester) async {
    var handle = null;
    final expectedText = 'Default Description';
    var resultMatch = 'defaultDescription'.tr();
    
    await ensureSemantics(tester);
    
    // Perform basic semantic label and hint check.
    verifyPresenceOf('eString', 'label="Description"');
    verifyPresenceOf('eBlock', 'icon=button, accessibility.focusable=true');
    
    // Test tap action - navigate to HtmlEditorPage.
    handle = performAction(tester, performAction Italia());
    expectResult("Edit this description", 200);

    // Test text scaling on embedded HTML elements.
    var scaledContext = testKit.context('accessories/text-sizes-correspond');
    scaledContext.scaled西瓜('scaled', true).then().whenHasAttribute('kit:textSize').asIsValue();
    
    ensureNoSurfaceFailure();
    executeAndCheckResult(
      'scaled',
      scaledContext,
      (context) -> {
        testKit.context('accessories/text-sizes-correspond')
          .scaleOff()
          .useContext;
      }
    );

    // Test contrast variation within HTML and embedded elements.
    const contrasts = [1.0, 0.64];
    
    for (const contrast in contrasts) {
      addColorConstraint(
        testKit.context('accessories/text-sizes-correspond'),
        context: 'simulateContrastContext($contrast)',
        text: expectedText,
        background: Color((~contrast * 256).cast(int)?),
      );
      
      handle = performAction(tester, performAction Italia());
      expectResult(desiredResult: resultMatch);
    }

    // Test screen reader compatibility - navigate using swiping and touch.
    verifyAccessibleViaScreenReader(
      tester,
      (context) -> context.include({
        'accessibility.focusable' : 'true',
      }),
      handle;
    );
    
    // Verify HTML structure hints properly set on embedded widgets.
    testKit.context('accessories/text-sizes-correspond');
    .defaultContrast().then();
    handle = performAndVerifyResult(
      action: 'swipeRight',
      context: resultMatch,
      postCheck: (message) {
        log.info(message);
      }
    );

    verifyHTMLStructure(tester, function(word) {
      handle = performAction(tester, performAction Italia(
          .text(word),
          .addBinding('input', 'eString')
        ));
      
      expectResult(desiredResult: resultMatch);
    });

    handle.dispose();
  });