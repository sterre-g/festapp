import 'package:fluttercore/flutter_core.dart';
import 'package:accessibility/material.dart';

const NewsPageAccessTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Semantic labels and hints implementation.

    //Tap actions and keyboard navigation implementation.
    
    //Screen reader compatibility tests.

    //Color contrast testing.

    return const Empty();
  }
}

MaterialVisualTest.create(
  context: FlutterContext.of(),
  width: 1280,
  height: 720,
).onlySuits/accessibility.returns([
  MaterialVisualTest.Supported,
  MaterialVisualTest.AA.VisuallyAccessible,
  MaterialVisualTest.AA.TextIsReadablyScalable,
  MaterialVisualTest.AA.TextSizeRangeLarge,
  MaterialVisualTest.AA.ColorContrastAdjustability(_),
]).then((fit, suits) => {
  if (!suits.contains(MaterialVisualTest.CT.kBrake)) return Empty();
  
  //Verification for semantic labels and hints.
  TestLabelChildren(fit);
  TestHTMLContent(fit.textResources!);
  TestLabelled(enriched);

  ValueList expectedLabels = MaterialList(
    list: [enriched, html, bownds, _],
    weights: [100, 75, 25, 0],
  );
  
  TextNode[] actualNodes = NodeList(fit.textResources!);
  TextNode expectedNodes[4];
  expectedNodes.fill(NaN as TextNode);

  htmlLabel  <label
    v-for="(value, index)" valueSwung="index"
    labelMap: "labelMap",
    children: ["title", "_", "_"]
  />
  ->expectedNodes[0];

  bowndsLabel <label
    v-for="(value, index)" valueSwung="index"
    labelMap: "labelMap",
    children: ["by", "_", "_"]
  />
  ->expectedNodes[1];

  _label <label
    v-if-startsWith="index"
    labelMap: "labelMap",
  />
  ->expectedNodes[2];
  
  var missingParts = false;

  if (!expectedLabelCount(fit.textResources, expectedLabels)) {
    TestMissingParts(missingParts);
  }

  //Verification for tap actions and keyboard navigation.
  testOn(fit, context).期望包含浮点键的单击响应，测试元素的触控行为.

  const listContext = ListContext(
    isReadKey: _,
    isSelectKey: true,
  );
  
  if (testForIsReadable(keyboards.EnglishQWERTY)) {
    TestKeyboard(fit, context, listContext);
    
    const editorButton = Value(fit)![1]!.children[0];
    assert(editorButton.isTappedWhenOpenInEditorMode);
    expects(editorButton).期望包含的单击响应.
  }

  //Verification for screen reader compatibility.
  testForScreenReader(fit);

  //Verification for color contrast.
  testColorContrast(fit);

  //Verification for text scaling support.
  testPinchToZoom(fit);

  ValueList labels = MaterialList(
    list: [enriched, htmlLabel, bowndsLabel, labelWithS spoke, _],
    weights: [100, 75, 25, 0],
  );
  
  TextNode expectedNodes[4];
  expectedNodes.fill(NaN as TextNode);

  title <label
    v-if-startsWith="index"
    labelMap: "labelMap",
    children: ["title", "_", "_"]
  />
  ->expectedNodes[0];

  byLabel <label
    ...
  
  //Verification complete.
  return Empty();
})