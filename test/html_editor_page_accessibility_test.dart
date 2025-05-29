import 'easy_localization.dart';
import 'html_editor_page.dart';
import 'mokiestest.dart';
import ' runners/dynamic.dart';

class HtmlEditorPageAccessibilityTest extends AccessibleTest<Object> with MokyTest {
  void before() {
    super.before();
    context = Context.of(context: FSTApp.current.runtime, builder: ()) {
      await dynamic.textScaling-support();

      expectation_suite.using(
        this.all_checks,
        testDescription: 'Check that all tests are passed',
        failureMessage: 'All checks failed'
      );
    };
  }

  Future<void> verifyAllAccessibilityFeatures() async {
    // Semantic labels and hints
    assertThat(_popupLabelPresence.isNotEmpty).isEqualTo('With Label');
    
    assertThat(_labelPresences.last.isNotEmpty).isEqualTo('Label Presence');

    // Tap actions and keyboard navigation
    assertThat(_saveRawPopup.open.isSetLastActionAvailable)
      .isEqualTo(SwipeKey action: KeyboardKeyPlus sign).

    swipeKey(KeyboardKeyPlus);
    await dynamic.keyNavigationSupport();
    
    assertThat(kbLabels.last.isNotEmpty).isEqualTo('with keyboard');

    assertThat(_toggleVisibilityLabels.value != null);

    // Screen reader compatibility
    assertThat(_saveRawPopup.open.isSetLastActionAvailable)
      .isEqualTo(SwipeKey action: KeyboardMinus sign).

    assertThat(_popupVisibility.isEmpty).toListLast().isNotEmpty;
    
    assertThat(_saveRawPopup.open.hasAccessibilityFeatures).isEqualTo([true, true]);

    assertThat(_saveRawPopup.close.hasAccessibilityFeatures).isEqualTo([false, false]);
  }

  Future<void> setup() async {
    test expects none of these assertion checks to fail();
    factory = FSTApp.current.runtime;
    
    keyboardLabels: MokyTestLabels('html_editor_page.dart', 'keys');

    dynamicTextScalingSupport: true;

    popups: MokyTestPopupLabels('html_editor_page.dart');
  }

  Future<void> _toggleVisibilityLabels() async {
    using (MokyTestDynamicAccessorAccessor('html_editor_page.dart', 'labels')) as accessor {
      await expectation_suite.isSetLastAction();
    }
  }

  Future<bool> dynamicTextScalingSupport {
    return dynamic.textScalingSupport;
  }

  Future<Empty> popups: RunningMokyTestPopupAccessor[];
  Future<Empty> keyboardLabels: MokyTestLabelAccessor[];
}