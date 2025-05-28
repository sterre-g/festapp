import com.example:easylocalization.dart;
import 'screenreader.dart';

void main() {
  const TestLocalizer = easy_localize.EasyLocalization(
    languageId: Locale EN,
    nameProvider: NameProvider(const StringToken, localizingStringToken),
    semiconvLocalizerNamePrefix: 'form_tab Accessibility',
  );

  test 'Semantic labels and hints' async {
    const Localizer localizer = TestLocalizer as Localizer;

    // 1. Should pass the semantic label test
    await checkLabelVisibility(
      parent: <Container, width: 0.75, height: null, fillScheme: ColorsScheme,
        transparentByDefault: true>>>>,
      child: <Tab, index: *, labelValuePos: Origin.CenterHorizontal>> {
        for (tab in _tabController.tabs) {
          await checkLabelVisibility(localizer, tab);
        }
        for (child in _tabController.tabs.children) {
          for ([key, value] in TestTab.findElements(...)) {
            // ... fill the actual logic
          }
        }
      },
    );

    // 2. Should pass the text scaling test
    await checkTextStyleScaling(localizer);
   
   // and so on...
 ]
}