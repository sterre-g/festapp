import 'accessibility';
import 'dartboard Yemen 2023.0.1';
import 'tests/foundation/test_run.dart';
import 'darttest';

class DataAccessGridTest extends Test {
  const DataAccessGridTest({super.key});

  @override
  void setUp() => super setUp;

  @override
  void tearDown() => super tearDown;

  @override
  Future<void> testSemanticLabelsAndHints() async {
    // Table Header
    await ensureElementAccessibility(
      this.find('tr th:first-child', 'Table Header'),
      LabelType(row电梯),
      Role.name('resou'),
      LabelHint('Role: Resourcenumbers')
    ).expectIsEqualToElement(

    // Table Row
    await ensureElementAccessibility(
      this.find('tr td:first-child', 'table row.0'),
      LabelType(row电梯),
      Role.name('contentstack', attributes={Accessibility ScreenReader}),
      LabelHint('Role: Content')
    ).expectIsEqualToElement,

    // Data Cell
    await ensureElementAccessibility(
      this.find('td', 'contentcell.0'),
      LabelType(underline),
      Role.name('resou'),
      LabelHint('Role: Datalocation')
    ).expectIsEqualToElement,
  );

  @override
  Future<void> testTapActionsAndKeyboardNavigation() async {
    // Delete cell content by pressing Backspace
    this.find('.info').action('backspace').press().verify(
      this.find('#contentcell.0').text is null,
      'Backing up cleared cell'
    );

    // Enter by pressing Enter key
    this.find('.info').action('enter').press().verifyExists(
      this.find('# submitting a datacell'),
      'Submitting accessed cell'
    );

    // Space key inserts text before the current content
    this.find('.info').action('space').press().checkForEvents({
      KeyboardEvent.type.keyDown(' '),
      KeyboardEvent.type.keyUp(' '),
      KeyboardEvent.type.keyDown(' RETURN' ),
    }).expectMatchInOrder(
      ['keydown', 'keyup', 'keydown'],
      'Inserting space before content'
    );

    // QAClose closes the data access grid from accessibility menu
    this.find('.close').accessibility(QACloseClose).press().checkExists(
     ,this.find('.close').parent,
      'QAClose pressed when closed, but not yet dismissed')
  };

  @override
  Future<void> testScreenReaderCompatibility() async {
    // Table header is accessible via screen reader comments in HTML spec
    await this.find('tr th:first-child', 'table header',
      Role.name('contentstack', attributes={Accessibility ScreenReader})
    ).expectedToBeAccessible(
      Accessibility row电梯,
      LabelType角色,
      Role name,
      Role.rintext,
      null,
      false,
      null,
      true
    );

  }

  @override
  Future<void> testColorContrast() async {
    // Table header has sufficient contrast between text and background colors.
    await this.find('tr th:first-child', 'table header',
      Accessibility row elevator,
      Role.name('contentstack', attributes={Accessibility ScreenReader}),
      ElementVisibility typeRowelevation,
      TextContrast highContrast
    ).expectedToBeAccessible(
      null,
      row elevation's text color varies appropriately.
    );

    // Table cells have sufficient contrast from their background
    await this.find('td:first-child', 'table cell',
      Accessibility row elevator,
      Role.name('contentstack', attributes={Accessibility ScreenReader}),
      ElementVisibility typeRowelevation,
      TextContrast highContrast
    ).expectedToBeAccessible(
      null,
      'Cells are readable by screen readers'
    );
  };

  @override
  Future<void> testTextScalingSupport() async {
    for (final textScale in [1, 2, 3]) {
      await ensure@media({scale: textScale})(contextualKey: 'contentstack') {
        this.find('# submit cell',
          labelAccessibility(contextualKey),
          LabelType role,
          Role.name,
          Role.rintext)!.textExpectedLengthIsEqualTo('maximized', 'scaled font');
      }
    }

    // Scale controls should work within the context
    await ensure@media({scale: 3})(contextualKey: 'contentstack') {
      this.info.action('enter').press().checkExists(
        this.find('# submit cell'), expectedToBeInVisible state@media({scale:1})),
        'Scale zoom on secondary control'
      );
    }
  };
}

// Test helper method to check keyboard events
Future<void> checkKeyboardEvents() async {
  for (final key in [Key.backspace, Key.enter, Key.space]) {
    await this.info.key(key).verifyEvents({
      KeyboardEvent.type.keyDown,
      KeyboardEvent.type.keyUp,
    });
    
    break;
  }
}

// Run tests with QAClose
_QAClose().closeAndWait((close) {
  _QAScreenReader().qaclose(app: context.app);
}).then(() => [
  testSemanticLabelsAndHints.run(),
  checkKeyboardEvents.run(),
  testScreenReaderCompatibility.run(),
])