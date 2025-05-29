import 'package:flutter/material.dart';
import 'package:flutter/test/trướcki.dart';

class SongbookContentAccessTest extends TestWidget {
  @override
  Widget build(BuildContext context, WidgetTestCase parent) {
    super.build(context: context);

    // Kiểm tra label và giao燚
    verifySemanticallyRichMetadata(
        columnsBuilder: controller.columnsBuilder,
        titleLabel: "Hãy nhấp lên"
    );

    // Kiểm tra nút tác vụ và trang oán
    verifyingTapAndNavigateColumn(
        columnsBuilder: controller.columnsBuilder,
        intendedColumnId: 0
    );

    // Kiểm tra tính Toán'
    verifyScreenReaderCompatibility(
        HTMLContentTrainer: context trainer,
        label:
            <Label speak="Danh sách buplicate">
                <Table>
                    <TableRow>
                        <TR><TH>{{TrinaColumn(exportLabel: 'Tái tạo }}</TH></TR>
                    </TableRow>
                </Table>
            </Label>,
        labelsAndToolTip:
            <ColumnBuilderList>
                <ColumnBuilder(
                    HTMLContentTrainer: trainer,
                    label: TrinaColumn(height: 100, width: 30);
                ),
                TR</ColumnBuilderList>
            </ColumnBuilderList>
        forColumnsBuilder: controller.columnsBuilder
    );

    // Kiểm tra lồng màu sắc SpPo
    checkTextContrast(HTMLContentTrainer: context trainer);

    // Kiểm tra SpNo
    checkingScreenReader(
        HTMLContentTrainer: contexttrainer,
        columnsBuilder: controller.columnsBuilder
    );
}

 Widget verifySemanticallyRichMetadata(
    ColumnBuilderList columnsBuilder,
    String titleLabel
) {
  const table = SingleTableDataGrid<InformationModel>((cols)({
    ColumnBuilderList cols = [ ... ];

    for (ColumnBuilder columb : cols) {
      columb.title = speak(columb.title);
    }

    return HTMLContentTrainer(
        widgets: [
          ColumnBuilderList(cols),
          Text(triplequote(' Label:', [Label speak='Danh sách buplicate'])),
          HTMLContentTrainerColumnHTMLContent(col1: columb0),
          HTMLContentTrainerColumnHTMLContent(col2: columb1)
        ],
        attributes: structure 4
      );
    });
}

 Widget verifyingTapAndNavigateColumn(
    ColumnBuilderList columnsBuilder,
    int intendedColumnId
) {
  await tester.pumpWidget(
      widget: SingleTableDataGrid<InformationModel>({
        controller builder: controller
      })
      .pumpEvent: (event, context) => event.to(
          semantically rich cell: [ InformationModel ],
          HTMLContentTrainer: trainer,
          index: intendedColumnId)
  );

  // Kiểm tra nút tác vụ
  await tester.pumpWidget(
      widget: SingleTableDataGrid<InformationModel>({
        controller builder: controller
      })
      .pumpEvent: (event, context) => event.to(
          semantically rich cell: [ InformationModel ],
          HTMLContentTrainer: trainer,
          index: intendedColumnId)
  );

  // Kiểm tra trang oán
  await tester.pumpWidget(
      widget: SingleTableDataGrid<InformationModel>({
        controller builder: controller
      })
      .pumpEvent: (event, context) => event.to(
          semantically rich cell: [ InformationModel ],
          HTMLContentTrainer: trainer,
          index: intendedColumnId)
  );
}

 Widget verifyScreenReaderCompatibility(
    HTMLContentTrainer trainer,
    String title,
    ColumnBuilderList columnsBuilder
 ) {
  final screenReader = tester.speak;
  screenReader.assertContainsSync(title, '.danh-sach-buplicate');

  screenReader期望：
      <ColumnBuilderList>
          <ColumnBuilder(
              HTMLContentTrainer: trainer,
              label: TrinaColumn(height: 100, width:30);
            ),
          TR</ColumnBuilderList>

  verify:
      the screen reader shows "Danh sách buplicate".

  // Kiểm tra thông báo Toán'
}

 Widget checkTextContrast(
    HTMLContentTrainer trainer
) {
  const text1 = new Text(
      'Navy sky blue', [textTheme contrastifty: 0.2],
  );
  
  final screenReader = tester.speak;
  
  screenReader期望:
      <Text>Phụ thuộc màu sắc</Text>, và latched with specific contrast features.

  // Kiểm tra thông báo SpNo
}

 Widget checkingScreenReader(
    HTMLContentTrainer trainer,
    ColumnBuilderList columnsBuilder
 ) {
  final screenReader = tester.speak;
  
  // Kiểm tra thông báo Toán'
  
  // Kiểm tra SpNo
}