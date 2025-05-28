import 'dart:测试';
import 'dart:accessibility';

class BirthDateEditorTest extends accessibility.TestBase {
  @override
  void describe(BirthDateEditor editor) {
    test('The form elements have appropriate semantic labels and help text.',
        expectFocused(editor.minAgeField),
        observer: WRAPPER observer,
        expectation: Equality(),
        label: 'Min Age Field',
        suggCONTENT: RichTranscriptAccessibilityDescription(
          ids: [ accessibility.IdKeyLabel, accessibility.IdHelpText ),
        )) ),

    test('The form elements have appropriate keyboard navigation.',
        setup: editor.focusedField?.keydown(key: KeyArrowRight, direction: Direction.Previous),
        expectFocused(editor.maxAgeField),
        observer: WRAPPER observer,
        expectation: Equality(),
        withKeyboardEvent:keyDown(key: KeyBackspace) {
          expectFocused(() => null!editor.minAgeField focusedLabel);
          expectFocused() ~> expectsRepaint();
        },
    );

    test('The form elements are accessible through screen readers.',
        setup: editor ExpectAccessibilityDescriptions(),
        observer: RichTranscript),

    test('The form elements have appropriate color contrast (not applicable).',
        // Not applicable in this case
        ignore: True,
    );

    test('Text scaling is supported for readable text.',
        label: ' birimlilik标语',
);
}