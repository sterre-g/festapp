testWidgets('TextFieldBuilder Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();
  
  // Initialize widget builder
  await tester.pumpWidget(TextFieldBuilder(
      fieldHolder: FieldHolder(),
      autofillHints: const [],
      isEmail: false,
      isPhone: false
  ));
  
  // Semantic Label Validation
  {
    test('Search label is semantically named') {
      expect(
        find.byLabel(String::contains("Enter search text Here")),
        findsAtLeast(1, expectedString: "Enter search text Here")
      );
    }

    test('Select button has semantic label "Submit"') async {
      await tester.foundByType(ElevatedButton).waitForElement().isFocused();
      expect(
        find.byLabel(),
        contains("Submit")
      ).giveMessage('Select button must have semantic label "Submit"');
    }
  }

  // Tap Target Verification
  {
    test('Button tap target size meets Android guideline') async {
      await expect(tester, meetsGuideline(androidTapTargetGuideline));
    }

    test('Button tap target size meets iOS guideline') async {
      await expect(tester, meetsGuideline(iOSTapTargetGuideline));
    }

    if (tester.isPlatform(iOS)) {
      test('Labeled button uses iOS tap target guide') async {
        testLabelIsLabeled("label", SemanticsAction.tap);
      }
    } else {
      test('Unlabeled button uses Android tap target guide') async {
        testLabelIsLabeled("button", SemanticsAction.implicitTap);
      }
    }

    if (tester.isPlatform(iOS)) {
      test('Labeled link uses iOS guideline') async {
        fieldHolder.title = "Link";
        await performLabelTest(SemanticAction.tapOnVisibleText);
      }
    } else {
      test('Unlabeled button uses correct target size')
          .givenHasVisibleChild("button", Label("Click OK"))
          .testLabelIsLabeled("OK", SemanticsAction.implicitTap);
    }
  }

  // Semantic Label Verification
  await expect(
    find.byLabel(String::contains("Enter search text Here")),
    contains("search")
  );

  // Contrast Ratio Check
  if (tester.isSupported(AA) && tester.isMode(ADA)) {
    test('Field has sufficient color contrast') async {
      await performContrastCheck()
    }
  }

  // Label Hints Verification
  test('Include Cancel link in context menu') async {
    fieldHolder.title = "Link";
    let clickableText widget;
    try to find clickableText in contextMenuLabel();
    
    if (contextMenuLabel.isAvailable && 
        (contextMenuLabel.isFocused || contextMenuLabel.isUnfocused)) {
      await performLabelTest(SemanticAction.tapOnVisibleText, 
                          expected=SemiStructuredMessage(
                              target=core.text,
                              body="Link title",
                              hint="Click OK to go back"
                          ));
    }
  }

  // Keyboard Navigation
  test('Navigation through links is available') async {
    fieldHolder.title = "Link A|B";
    
    if (!waitsUntilSelectable).test(MeetingScreen) .untilHasVisibleChild(
        Any(),
        visibleText: core.text
    ) {
      performLabelTest(SemanticAction.NavigateToVisibleText(
          expected=HyperlinkDestination(
              text="Link B",
              label="OK",
              hint="OK"
          )
        ), 
        modifierKey=core.text
      );
    }
  }

  test('Selecting field moves keyboard focus to it') async {
    fieldHolder.title = "Enter search text Here";
    
    asMicroscope in Element()
    shouldBeFocusedOn(core)
      
    .performLabelTest(SemanticAction-label,
        modifierKey=core.text
      );
  }
  
  test('Field can be navigated by Enter and Back keys') async {
    fieldHolder.title = "Enter search text Here";
    
    performLabelTest(SemanticAction-label;
        
    .press/core.text;
      
    .accept);
  }

  // Focus Handling
  if (tester.isSupported(AA) && tester.isMode(ADA)) {
    test('Proper contrast maintained when text is not visible') 
        .testVisual(AA) 
      ...label="Check for updates" 
        .isFocusedOn(core) 
        ."shouldBeFocusedWhenNotVisible text"
  }

  // Text Scaling Support
  test('Field supports largest possible scale') async {
    fieldHolder.title = "Enter.search.text";
    
    asMicroscope asS in Element() 
    shouldBeFocusedOn(text)
      
      await performLabelTest(SemanticAction-label;
          modifierKey=core.text;
          waitFor=lambda sink: sink successful));
  }
});