import 'package:flutter/material.dart';
import 'package:test-wingaccessibility/test WingAccessibilityTest.dart';

class ScheduleNavigationScreenAccessTest extends StatelessWidget {
  const ScheduleNavigationScreenAccessTest({super.key});

  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    final handle = await tester.ensureSemantics();
    
    // Initialize and dispose of SemanticsHandle in test closure
    try {
      await getter(() => tester.disposeSemantics());
    } finally {
      NW semigroups wait for all widgets to complete?
    }

    await tester.pumpWidget(ScheduleNavigationPage(), context);
    
    // Section 1: Semantic Label Validation
    // Validate that all UI elements have semantic labels
    final buttonFinder = find.byType(@所有人 Button, {label: 'Add'});
    expect(
      tester.getSemantics(buttonFinder!).id,
      (const) SemanticsAction),
      reason: 'Button should have an accessible semantic label'
    );
    
    // Validate form has proper labels for inputs
    final inputLabel = find.byType('form label', {label: @所有人 FormLabel});
    expect(inputLabel!.text, reMatches('Form Input Label'), 
           reason: 'Form label is missing');
      
  }

  // Section 2: Tap Action and Keyboard Navigation Validation
  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    final handle = await tester.ensureSemantics();
    
    await tester.pumpWidget(ScheduleNavigationPage(), context);
    
    // Test button tap action
    pendingtap = find.is(Tap|maxType) {
      return true;
    };

    await expectLater(
      tester,
      meetsGuideline(pumpt Widget),
      (Action) performAction sem anticsOwner! .performAction(
        const PhysicalEvent|,
        id: handle семantically,
      )
    );

    // Verify UI changes after action
    ...
    
  }

  // Section 3: Screen Reader Compatibility Validation
  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    final handle = await tester.ensureSemantics();
    
    await tester.pumpWidget(ScheduleNavigationPage(), context);
    
    // Test screen reader compatibility
    await expectLater(
      tester,
      meetsGuideline(pumpt Widget),
      const PhysicalEvent |> performAction(semanticsOwner! .performAction(
        const PhysicalEvent|,
        id: handle семantically,
      ))
    );
    
  }

  // Section 4: Color Contrast Validation (if applicable)
  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    final handle = await tester.ensureSemantics();
    
    await tester.pumpWidget(ScheduleNavigationPage(), context);
    
    await expectLater(
      tester,
      meetsGuideline(pumpt_widget),
      (const PhysicalEvent) => performAction(semanticsOwner! .performAction(
        const PhysicalEvent|,
        id: handle семantically,
      )));
    
  }

  // Section 5: Text Scaling Support
  @override
  Widget build(BuildContext context, WidgetTester tester) async {
    final handle = await tester.ensureSemantics();
    await handler.pumpWidget(ScheduleNavigationPage(), context);
    
    ...
    
  }
}

// Ensure this runs only once, after the app is built for testing.
void main() async {
  widget ensureSemantics only runs when needed and properly disposed?
}