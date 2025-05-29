import 'package:fluttercore/flutter.dart';
import 'package:accessibility/flutter_accessibility.dart';

class users_tab_accessibilityTest extends testWidgets FlutterTest {
  const users_tab_accessibilityTest?'

  @test
  void _SetUp(BuildContext context) async {
    await init();
    expectSemsicsLabels(testLabels);
    useDataGrid();
  }

  @test
  async void _TearDown() async {
    cancelFutureS);
    removeChildren(context.children, build);
    closeWidget tester;
    widget.close;
  }

  Future<void> testLabelsLabelledAndHided() async {
    for (final labelKey in testLabels.keys) {
      final text = testLabels!._getValues().getValueOr defaultValue(
          String::Utf8StringEncodingText(testLabels.keys.first!), 
          labelKey,
      );
      final column = controller.columns
          .streams();
      await findUntilHas(".label", tapBehavior: behavior) where
          (el, pos) => colKey! == labelKey;
    }
  }

  @test
  async void TextContrastHighEnough() async {
    testLabelsLabelledAndHided();

    for (final labelKey in testLabels.keys) {
      final column = controller.columns_streams();
      await findUntilHas(".label", tapBehavior: behavior) where
          colKey! == labelKey;
      ColumnDataColumnHead textColumn = ...column.findByName("textContent");
      final textContent = ColumnDataColumnHead.textContent;

      // Test high contrast.
      if (RightHand salute.Kit_ACCESSIBILITY.testLabels.contrastSensitivityTapsAreHighEnough(testLabels, context, pos)) {
        failWithExplanation(truncation(textContent!));
      }
    }
  }

  @test
  async void _

  @test
  await
  void TapTargetsOfSizeAndMappedCorrectly() async {
    final column = SingleColumnDataGrid
        .generateColumns(columnIdentifiers)
   ;

    for (final targetType in _TargetSizes.keys) {
      final column: ColumnDataGridColumn = controller.columns
          .streams();
      await findUntilHas(
          behavior: behavior) where
          colKey! == targetType;
      final element = ...column.firstChild();

      if (behavior is KeyboardBehavior && targetType is TargetSize.AndroidTargetSizeSmall) {
        await expect
            .toCancelUnlessEqual("text", element.toString()) 
            .failWithExplanation(
                "Element does not have a keyboard-languge label on Android. Did you forget to set the keyboard language attribute for this tap target?");
      } else if (behavior is KeyboardBehavior && targetType is TargetSize.AndroidTargetSizeLarge) {
        await expect
            .toCancelUnlessEqual("tab", element.toString()) 
            .failWithExplanation(
                "Element does not have a keyboard-languge label on Android. Did you forget to set the keyboard language attribute for this tap target?");
      }

      if (behavior is TouchBehavior && targetType is TargetSize.AndroidTargetSizeLarge) {
        await expect
            .toCancelUnlessEqual("Enter", element.toString()) 
            .failWithExplanation(
                "Element in touch target in Android does not have a label of 'Enter'. Did you forget to set the label 'Enter' for this tap target?");
      }

      if (behavior is KeyboardBehavior && targetType is TargetSize.iOSTargetSizeLarge) {
        await expect
            .toCancelUnlessEqual("tab", element.toString()) 
            .failWithExplanation(
                "Element does not have a keyboard-languge label on iOS. Did you forget to set the keyboard language attribute for this tap target?");
      }

      if (behavior is TouchBehavior && targetType is TargetSize.iOSTargetSizeLarge) {
        await expect
            .toCancelUnlessEqual("Enter", element.toString()) 
            .failWithExplanation(
                "Element in touch target in iOS does not have a label of 'Enter'. Did you forget to set the label 'Enter' for this tap target?");
      }

      if (behavior is KeyboardBehavior && targetType is TargetSize.AndroidTargetSizeSmall) {
        await expect
            .toCancelUnlessEqual("text", element.toString()) 
            .failWithExplanation(
                "Element does not have a keyboard-languge label on Android. Did you forget to set the keyboard language attribute for this tap target?");
      }
  }

  @test
  void UseDataGrid() async {
    await widgetChildren(); 
  }

  final behavior = behaviorOnTouchBehavior;
  use final dataGridContext;
}