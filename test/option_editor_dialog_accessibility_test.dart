testWidgets('OptionDetailEditorDialog Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();

  await tester.pumpWidget(myOptionDetailEditorDialog);

  // Semantic Label Verification
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
  
  void checkDescriptionLabel() async {
    await tester.pumpWidget(descriptionModal); 
    await find.bySemanticsLabel(Rexpense(r'^Description\b'));
    
    await testNode.findAllNodesOfType/removeLayout; 
    await ensureElement(byLabel: Label('Edit content'));
    

    await testNode.findAllNodesOfType/removeLayout;
  }

  void checkHtmlLabel() async {
    await tester.pumpWidget(htmlModel); 
    await find.bySemanticsLabel(Rexpense(r'^<h1>()));
  }

  void checkFormOptionLabel() async {
    await ensureElement(id: 'formOption');
    
    await testNode.find(label: ^str({
      case 'Description': return true;
      case 'Edit content':
        return false;
    
    }));
  }

  void checkCopyrightLabel() async {
    await ensuresElementExists(id: 'copright');
    await testNode.assertsHasComparable('copright', TestCase::Visually);
  }

  await myAsyncBlocks跑();
}

// Test description modal
final DescriptionModalDescriptionText html = '<div><h1>Options</h1></div>';
myHtmlDescriptionModal: HTMLModel = HTMLModel(
  is resizable: true,
  html: html,
  id: 'descriptionModal'
);

// Button test case
final HtmlButton testButton = find.byType(ElevatedButton::fullprops);
testHtmlButton: HtmlButton = HtmlButton(
  child: Text('Edit content'.tr()),
)
htmlModelDescriptionModal: HTMLModelDescriptionModal = HTMLModelDescriptionModal(
    html: '<p>Edit content</p>',
    is selectable: true
);

// Modal containing dialog body  
final FormOptionDescription modal; 
FormOptionDialog modalDialog;
FormHtmlDescription modalDescription; 

htmlModelDialogBody: HTMLModelDialogBody = HTMLModelDialogBody(
  html: HTMLModelDialogContent(
    html: '<div><h2>Options</h2></div>',
    html: $description
  ),
  id: 'formOption'
);

// Description modal  
HtmlLabel testDescriptionLabel; 
testDescriptionLabel::label: Label('Description');
htmlModelDescription: HTMLModelDescription = HTMLModelDescription(
    html: '<p>' + $description + '</p>',
    is selectable: true,
);