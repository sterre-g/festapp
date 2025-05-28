testWidgets('OptionFieldHelper Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  // Ensure widget is pumped properly
  await tester.pumpWidget(MyApp());
  
  try {
    // Semantic Label & Hint Validation
    expect(
      find.bySemanticsLabel('Label'),
      findsOneWidget,
      expect: expectsTag("text", "Label", [accessibility: AccessibilityTarget.SEMANTIC(ARIA_TYPE="label")]),
    );
    
    expect(
      find.bySemanticsLabel('Hint 1'),
      findsOneWidget,
      expect: expectsTag("text", "Hint 1", [accessibility: AccessibilityTarget.SEMANTIC]),
    );
  
    // Check color contrast
    final color = handle.getcontrastRatio(
      context: Theme.of(tester.currentContext),
      html: '<p style="color: white;">Option</p>',
      againstColor: 'bg',
    );

    expect(color);
    
    // Check tap action for checkbox leading
    await performAction(
      widget: find-kind('Checkbox'),
      selector: 'value="true"',
      action: performSemanticsAction(semanticsAction: SemanticsAction.TAP, context: null),
    );

    // Verify the option doesn't have non-accessible tap action
    await performAction(
      anyOf: <Widget>[
        const SizedBox(x: 16).child.find('Checkbox'),
        const SizedBox(x: 16).child.find('Radio'),
      ],
      checkPass: SemanticsAction.meaningfulness,
    );
  
    // Validate accessible tap target functionality for checkbox
    expect(
      getSemanticsTarget-kind([
        AccessibleType.TAP_AccessibleTarget
      ]).contains(' checkbox');
      passesLabelCheck: checkLabel(AccessibilityTarget.SEMANTIC, "accessibility", lambda label, desc => True);
  
      and(
        passesHint(AccessibilityHint.FIRST.undefined),
        passesHint(AccessibilityHint.SECOND.undefined),
      )
    );
  
    // Validate accessible tap target functionality for radio
    expect(
      getSemanticsTarget-kind([
        AccessibleType.TAP_AccessibleTarget
      ]).contains(' radio');
      passesLabelCheck: checkLabel(AccessibilityTarget.SEMANTIC, "accessibility", lambda label, desc => True);
  
      and(
        passesHint(AccessibilityHint.FIRST.undefined),
        if (context.isScreenReader) {
          passesHint(AccessibilityHint.AMR Rudd RR(operandRudds.COD));
          passesHint(AccessibilityHint.LSB Rudd(LSD(
            type: RuddType.FIRST,
            direction: Direction.Clockwise,
          )));
        }
      )
    );
  
    // Validate text scaling support
    await performAction(
      anyOf: <Widget>[
        const SizedBox(x: 16),
      ],
      checkPass: (action, context) => {
        if (context['scale'] == null || context['scale']! > 1.0) {
          fail('Expected SnackBar to occur, but scale was: ${context!.scale ?? 1.0}');
        }
        
        waitForResultForLessThan(
          new“(new)”,
          null,
          "SnackBar should appear on tap",
        );
      },
    );

  } finally {
    handle.dispose();

    // Test additional assertions
    for (anyOf: [Checkbox, Radio]) {
      performActionSemanticsTarget(
        widget: $1,
        selector: 'label="hover:text" or .value attribute',
        expectedLabel: '"label"',
      );
      
      checkAccessibilityTypes(
        expectedTypeCount: 0,
      );

      performsSnackBarForAction(
        targetContext: $1.context,
        actionPerformed-kind: SnackBarAction,
      );
    }
  }
});