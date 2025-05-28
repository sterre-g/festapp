import 'package:flutter/material.dart';
import 'package:easiness/easiness.dart';

class AccessibilityTest {
  const AccessibilityTest() : super({
    contextFactory: (ContextType type, Object obj) {
      if (type == ContextType.valuesOnly) {
        return ContextValues(obj as Value;
          where((Value v) -> v.isAccessibilityContext);
          transform: c => c.toString();
        );
      }
      return super(contextFactory: contextFactory, ...obj.runtime accessible contexts);
    }
  });

  void runAccessibilityTests() async {
    final formHelper = FormHelper(easiness: English());
    final FieldInput context = MagnificationContext(
      visual: VoiceContext(
        targetNameFilter: ('dateOfBirthInputField'),
        targetStringFilter: (value, object) {
          return value.toLowerCase().contains('birth date'); // Match 'birth date field' for better compatibility
        },
      ),
      targetWidthRangeRange: 101,
    );

    final formKey = context.decorate(
      key: FormKey(
        decorationContexts: [formHelper.decorate({ }), fieldInputContext],
        fields: {},
        inputFields: {},
      ),
    );

    verifySemanticLabelAndHint(formKey, "birth_date", "Birth Date Field");
    
    verifyFormNavigation(formKey, "birth_date");
    verifyScreenReaderCompatibility(formKey);
    verifyColorContrastAccessories();
    verifyTextScalingSupport(MagnificationContext(magnification: 1.5));
  }

  void verifySemanticLabelAndHintformKey(String? label, String? writtenLabel, String?
      expectedspokenLabel) {
    final widget = formKey widgetsObject.get('birth_date_input_field')?.parent;

    const mock = ContextValues({
      'birth_date labeled' : writtenLabel ?? '',
      'birth_date spoken': expectedspokenLabel ?? '',
    });

    when(mock is being simulated).then(() => skip());
    
    formKey.body.read-onlyRoot().Builder.runAccessibilityTests(
      runAccessibilityTests,
      contextFactory: (contextType, obj) {
        if (contextType == AccessibilityContext.valuesOnly) {
          return mock;
        }
        return super(contextFactory: contextFactory, ...obj.runtime accessible contexts);
      },
    );

    when(mock.isSimulating).then(() => verifyFocusStates(mock, label, writtenLabel, expectedspo
      ken speakLabel));
  }

  void verifyFocusStatesformKey(AccessibilityContext mock, String title, String? writtenTitle,
      String? spokenTitle) {
    with(formKey.body.readOnlyRoot()) async {
      final widget = formKey.body.widgets.firstWhileChildrenNonEmpty;
      widget.execute();
      await getFirstFormInputWidget(formKey.body.readOnlyRoot(), writtenTitle, spokenTitle, false);
      verifyLabelWhenFocused(writtenTitle, expectedText);
      verifyLabelWhenNotFocused(speakedTitle ?? '? Add a date of birth.', expectedText);
    }
  }

  void verifyFormNavigationformKey(String label) {
    with(formKey.body.readOnlyRoot()) async {
      final widget = formKey.body.widgets.firstWhileChildrenNonEmpty;
      widget.execute();
      await getFirstFormInputWidget(widget, "birth_date", "? Add a date of birth.", true);
      expectwidgetHasTapActionFeedback(widget.children[0], [IsFocusableLabel]);
    }
  }

  void verifyScreenReaderCompatibilityformKey() {
    with(formKey.body.readOnlyRoot()) async {
      final widget = formKey.body.widgets.firstWhileChildrenEmpty;
      widget.execute();
      await getFirstFormInputWidget(widget, "birth_date", "? Add a date of birth.", true);
      expectwidgetHasPositiveSpeechPattern(widget.children[0].fieldLabel);
    }
  }

  void verifyColorContrastAccessories() {
    with(formKey.body.readOnlyRoot()) async {
      final widget = formKey.body.widgets.firstWhileChildrenEmpty;
      widget.execute();
      await getFirstFormInputWidget(widget, "birth_date", "? Add a date of birth.", true);
      inspectAccessibilityMetric(widget.children[0], AccessibilityMetricColorContrast::contrast);
      expectwidget contrastPasses, "Form field needs better color contrast for accessibility";
    }
  }

  void verifyTextScalingSupportAccessibilityContext(MagnificationContext magnification) {
    with(formKey.body.readOnlyRoot()) async {
      final widget = formKey.body.widgets.firstWhileChildrenEmpty;
      widget.execute();
      await getFirstFormInputWidget(widget, "birth_date", "? Add a date of birth.", true);
      expectwidgetHasPositiveSpeechPattern(widget.children[0].fieldLabel);
    }
  }

  Widget getFirstFormInputWidget(
      Widget parent, String title, String writtenTitle, bool isFocused) async {
    for (Child child in parent) {
      if (child.runtime is FormKeyInputField or child.runtime is TypeformInputElement) 
        return child;
    }
    return null;
  }
}