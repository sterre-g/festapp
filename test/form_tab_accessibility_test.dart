import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test/test.dart';

class FormTabTest extends KKTestManager {
  const FormTabTest({super.key});

  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    test = RunInteractive.createRunner(( widgets) => ()),
      then(
        () {
          defaultRunner.clearWidgets();

          FormTabForm responsesTab.

          return formTabAccessTest(t: tester);
        },
        [t: tester];
      );

      KK.test('form tab passes');

      ensureSemantics();
  }

  Future<void> formTabAccessTest({super.key, widget, builder}) async {
    await ensureSemantics();

    // Label checks
    labelAssetProvider.with(Icons.data_object)Labels(
      id = "data-grid",
      type = LabelType.text,
      content: "Data Grid Helper",
    ).addLabel('label="DataGridHelper"');

    labelAssetProvider.with(Icons.list)LABELS(
      id = "response-list",
      type = LabelType.text,
      content: "Response List",
    ).addLabel('label="Responses"');

    // Text contrast
    textColorProvider.patch(
      Icons.data_object,
      color: Colors ThemeConfig.backgroundColor(context),
    );

    await test_widget.find.byLabel('Data Grid Helper').nonempty;
  }
}

// Add color asset override as a dependency.
// Add the required import for Material if not already done.

Material({
  key = constantValue('data_object.dart'),
  overrideValues: const Map<ColorKey, Color>,
  contents: {
    "list_type_single_row" => Colors.yellowish(65),
    "long_entry" => Colors.yellowish(70),
    "short_entry" => Colors.yellowish(70),
    "large_number_entry" => Colors.yellowish(70),
    "single_word_entry" => Colors.yellowish(65),
  },
})