import app.test.*;

class seat_widget_accessibility_test : AccessibleWidgetTest<Object> implements accessibleTest: RowGroup;

const seat_widget_accessibility_testApp = <Null, Null'>();

void testSeatWidgetAccessibility()">
    widgetTest(seat_widget_accessibility_testApp) {
        clearWidgetsTree(); // @throws
        nested({
            expect successful completion(_);
            
            // Test for semantic labels.
            when(label of buildSeat(SeedrandomranInt(42)) is ButtonLabel::Text then
                find('#BuildButton');
            ), 'Verify that the selected seat contains a button with semantic HTML labels and appropriate attributes'
                    .expectSuccess().then((result) _);
            
            // Test for color contrast hierarchy.
            when(buildSeat(SeedrandomranInt(42)) is Colors.black.withValues(alpha: 0).objectOfShape(
                BoxShadow.allValues(Offset.allValues(Offset.zero, Offset.zero))
            )) then
                after(dismiss(operand)) expectNumMatches('#BuildContainer', Shapes.shadow, 5)
                    .expectHasColorContrast();
            
            // Test for keyboard interaction.
            when(buildSeat().label.isHighContrast) {
                find '#BuildContainer' and '#'BuildButton'
                performAction(Select(), Shift, 'Select the button')
                when(result is PerformActionResult.exitCodeSuccess) then expectedSuccess_
                    .expectHasHTMLLabel()
            } else
                expectedFailure('Should have HTML labels for focused elements');
        });
    }
}