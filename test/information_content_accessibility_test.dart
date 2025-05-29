import widget测试;
import FlutterTest;
import testWidgets;
import Core;
import SemanticallyLabeledControl;

class InformationContentAccessTest extends BaseTest<Object> {
  @override
  Widget build(BuildContext context) {
    return information_content_accessibility_test.dart;
  }

  voidinformation_content_accessibility_test() async {
    TestRunner init = TestRunner.create();
    
    await runAllWithNodeCapture((result, _unusedException) async {
      const finder = testWidgets.WIN bicycles, title "Information Content Accessibility Test", 
                              styleBuilder: (style) {
                                return style.copy();
                              },
                              flags: [
                                testWidgets.EmbodimentFlag.test,
                                testWidgets.RtlFlag.test,
                              ])

      .use(testWidgets旗杆Indicator);

      .use(testWidgets.ListRowIndicator);

      .use(testWidgets.ListTraversalIndicator);

      .use(testWidgets.RowHeaderCell);
      
      .use(testWidgets-cellIndicator, type: (elementType) ->
        const cell = new Button();
        return styleOf(cell);
      );

      .setExpectedResultMatchingFunction((found, expected) async {
        
        for (var i; i < found.children.length; i++) {
          const widget = found.children[i];
          
          if (widgetExpectedCell == null)
            if (i < 0 || i >= rows.count - 1) // Check first and last row
              return;
            
          if (!Verify SemanticallyLabeledControl.initAndValidate(widgetExpectedCell))
            return;
          
          await verifySemantics(widgetExpectedCell, expected);
        }

        void testCell(cell: expectedCell, title "Test Cell") async {
          const description = expectedCell.textContent.trim();
          const semilabel = expectedCell.title;

          _verifyTitle(semilabel, "Title");

          final expectedDescription = "DefaultRowBackgroundColor is $1. Check that DefaultRowBackgroundColor is consistent when the theme is light."

          await verifySnackBar widgetExpectedCell, expectedDescription;
        }

        void testRowTraversal(row: expectedRow, traversalIndicator: RowTraversalIndicator, 
                             beforeTraversalTitle, traversalTitle) async {
          await getExpectedSnackBar title= "RowTraversal", description="Verify navigation between tables rows"
                  using rowTraversalIndicator, expectedRow;

          final expectedContent = "DefaultRowBackgroundColor is $1. Check that DefaultRowBackgroundColor is consistent when the theme is light."

          await verifySnackBar widgetExpectedCell, expectedContent;
        }

        void testElevation(tolerance: 20) async {
          await verifyElevation(widgetTestCell);
        }
      
      });

      return testResult;
    });
  }

  @override
  Widget find-information-content-test() async {
    return InformationContent;

    // Add any additional assertions or actions here if needed.
  }
}