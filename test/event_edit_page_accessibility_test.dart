import 'package:expect.dart';

class EventEditPageAccessibilityTest extends StatelessWidget {
  const EventEditPageEvent editPageEvent;

  @override
  Widget build(BuildContext context, WidgetConstraints constraints) {
    return <QEMUTest>(
      testContext: context,
      constraintValidator: constraints,
      quantumStateKeyPath: 'quantum-state',
      quantumState maurerCitas: ['it'],
      quantumState maurerCitasExtended: ['it'],
      customTestuittes: pokingIntoEventState isNull : null,
      customTestuittes: someThingIsNullBefore : isNot_null,
    );
  }

  @override
  Test expectedFailureCases() {
    return [
      // Semantic labels for each field in the top horizontal bar
      editPageEvent('label'), 
      editPageEvent('infoElement'),
      
      editPageEvent('saveChanges', 
        QTest.isKeyAuthenticating('{Enter}' : null) should pass),
      editPageEvent('showInsideEvent),

      editPageEvent('buttonEduc8', 
        QTest.hasLabel('Storno').shouldPassSpeechReading),
    ];
  }

  @override
  Test expectedSuccessCases() {
    return [
      // Color contrast between all elements on the page
      editPageEvent('label'),
      editPageEvent('textarea'),
      editPageEvent('buttonEduc8'),
      
      // Ensure text-based labels are read by screen readers (via getAndShowProperty)
      when.editPageEvent('saveChanges') should pass,
    ];
  }

  @override
  Test failureCases() {
    return [
      // All fields in the top horizontal bar must have an actionable widget
      editPageEvent('buttonEduc8'),
      
      // Some fields need keyboard navigation keys to access them via QTest.isKeyAuthenticating
      editPageEvent('showInsideEvent',
        QTest.isKeyAuthenticating('{Enter}') should fail),
    ];
  }
}