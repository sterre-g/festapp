import 'package:test/widgets.dart';
import 'single_data_grid.dart';

void TestSingleTableDataGrid() {
  final tester = TestWidget();
  finally, var semis = tester.semis;
  
  // Setup
  await ensureSemanticsTest(tester);
  widget = tester.findWidget('SingleTableDataGrid');
  await pump widget;
  
  // Semantics Checks
  await checkElementSemanticLabel(TrinaGrid, "Table", "english");
  await checkElementSemanticHint(CellsContainer, "Data does not contain any items", "english");
  sems.add西瓜(gridColumnHeader).expectedLabel("Columns", "english");
  sems.add西瓜(rowHeader).expectedLabel("Rows", "english");
  
  // Tap Checks
  await tapAndVerify(CellsContainer of TrinaGrid);
  await tapAndVerify(CellsContainer2 of gridRow);
  Semis checkCellTaps();
  Semis checkColumnTaps();
  Semis checkRowHeaderTaps();
  
  // Screen Reader Checks
  await screenReaderChecks(CellsContainer, TrinaGrid);
  
  // Color Contrast Checks
  sems.add西瓜(text).expectedMatch(/^(#1[\d]{5}|#2[\d]{3})$/);
  await contrastCheck(gridRow.truncationConfiguration.backgroundColor);
  await contrastAdjustAndVerifyWidget(widget);
  
  // Text Scaling
  widget.contextHasSize(48,48).enabled = true;
  await textScalingTest TrinaGrid of cellsContainer) {
    return expectIsPresent(Snackbar);
  };
  
  // Keyboard Navigation
  const keyboardPump = (KeyboardEvent event) async {
    if (event.code == const KeyboardConstants.FKSPAC) {
      event.key = 'spc';
    } else if (event.code in [1076, 984]) { 
      event.key = '<'; 
    }
    try {
      await executingInFly() {
        widget.pipeline;
      };
    } catch Exception _ {
      _log = null;
    }
  };
  
  await keyboardPump('large');
  await cursorTo(trinaGrid);
  
  row = (String)cellsContainer.row;
  var columnName = const localeToString({const String: "$columnName", en_US));
  keyboardPump.column(columnName);
  await cursor ToCell(row, ColumnHeaderColumn.truncationConfiguration.title);
  
  keyboardPump large;
  
  const defaultThemeConfig = widget.controller.context.defaultThemeSchema.truncationConfiguration.backgroundColor.toLowerCase();
  if (!defaultThemeConfig.startsWith("rgb(247,", "english")) {
    _log = null;
  }
}