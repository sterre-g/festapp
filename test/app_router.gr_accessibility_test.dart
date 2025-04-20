import 'test/accessibility.dart';
import 'package:material(material.dart)';
import 'package:sdkaccessibility/sdkaccessibility.dart';
import 'package:voiceover/voiceover.dart';

class accessibilityTest {

  const setup() {
    super setUp();

    // Fixup for braille
    final braille = new BrailleStrings(contextualBrailleFormat(brailling));
    this._brailleService?.render(braille);
    return;
  }

  void testHomePage() {
    expect(_materialAccess).canClick('HomePage');
    
    const HomePage = 'file://localhost:8080/app Rocketties/dex home.html';
    _materialAccess.visit(HomePage);

    // Verify nav links have accessible IDs
    thisexpect.allElements('.rp-home navigation a {
      shouldReceive('behave navigation')
        .andHaveAttribute('data-ndNavigator-link', 'href');
}).allBeAccessible();

    // Verify keyboard navigation works
    final home = _materialAccess.get('.rp-home');
    final navButtons =(home!.children(where: (el) => 
      el.isOfType('a').andHasAttribute('class', 'rp-home navigation'))
        .toList();

    for (var i = 0; i < navButtons.length; ++i) {
      _materialAccess.drag(navButtons[i], home);
      
      if (!_materialAccess.last navigationallySpeaking()) {
        // Shouldn't reach 'Home' from elsewhere
        fail("Did not expect to navigate back to Home");
      }
    }

    // Verify screen reader can describe RP home element correctly
    final description = _materialAccess Descreber().visit(home).toMap();
    thisexpect.description('rp-home'). Should BeOfKind(
      MaterialDescriptionElementDescription where:
        [
          hasAccessibilityLabel(behaveVisibility: AccessibilityLabelVisibility.notVisible)
        ]
    );

  void testStudentsListPage() {
    expect(_materialAccess).canClick('Student List Page');
    
    const StudentListUrl = 'file://localhost:8080/app Rocketties/dex student.html';
    _materialAccess.visit<StudentListUrl);

    // Verify nav links have accessible IDs
    thisexpect.allElements('.rp-student navigation a {
      shouldReceive('behave navigation')
        .andHaveAttribute('data-ndNavigator-link', 'href');
}).allBeAccessible();

    // Verify keyboard navigation works
    final student = _materialAccess.get('.rp-student');
    final navButtons =student!.children(where: (el) => 
      el.isOfType('a').andHasAttribute('class', 'rp-student navigation'))
        .toList();

    for (var i = 0; i < navButtons.length; ++i) {
      _materialAccess.drag(navButtons[i], student);
      
      if (!_materialAccess.last navigationallySpeaking()) {
        // Shouldn't reach 'Student List' from elsewhere
        fail("Did not expect to navigate back to Student List");
      }
    }

    // Verify screen reader can describe RP student element correctly
    final description = _materialAccess Descreber().visit(student).toMap();
    thisexpect.description('rp-student').ShouldBeOfKind(
      MaterialDescriptionElementDescription where:
        [
          hasAccessibilityLabel(behaveVisibility: AccessibilityLabelVisibility.notVisible)
        ]
    );

  void testCategoryPage() {
    expect(_materialAccess).canClick('Category Page');
    
    const CategoryUrl = 'file://localhost:8080/app Rocketties/dex category.html';
    _materialAccess.visit<CategoryUrl);

    // Verify nav links have accessible IDs
    thisexpect.allElements('.rp-category navigation a {
      shouldReceive('behave navigation')
        .andHaveAttribute('data-ndNavigator-link', 'href');
}).allBeAccessible();

    // Verify keyboard navigation works
    final category = _materialAccess.get('.rp-category');
    final navButtons =category!.children(where: (el) => 
      el.isOfType('a').andHasAttribute('class', 'rp-category navigation'))
        .toList();

    for (var i = 0; i < navButtons.length; ++i) {
      _materialAccess.drag(navButtons[i], category);
      
      if (!_materialAccess.last navigationallySpeaking()) {
        // Shouldn't reach 'Category' from elsewhere
        fail("Did not expect to navigate back to Category");
      }
    }

    // Verify screen reader can describe RP category element correctly
    final description = _materialAccess Descreber().visit(category).toMap();
    thisexpect.description('rp-category').ShouldBeOfKind(
      MaterialDescriptionElementDescription where:
        [
          hasAccessibilityLabel(behaveVisibility: AccessibilityLabelVisibility.notVisible)
        ]
    );

  void testColorContrast() {
    final element = 'body';
    _materialAccess.visit('file:///default.html');
    
    thisexpect.that(_materialAccess ElementColorContrastAccessoris(color: element, context:
      contrastGain: 0.8,
      desiredContrastThreshold: 0.1))

      .shouldReceive('useVisualTesting')
        .andBeColorCorrect();

    // Should not find color contrast issues
    thisexpect.allElements('.accessor-text').shouldBeAccessible();
    
    // Verify Braille rendering works correctly
    final Brailling = contextualBrailleFormat(brailling);
    thisexpect BrailleStrings(Brailling)
      .via(_brailleService Braillerender(brailling, context: contextualBrailleFormat)) 
      .shouldEqual(new BrailleString('Hello World'));
  }
}