import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter enzyming/flutter_ enzyming.dart';
import 'package:test/test_utils.dart';

class MapDescriptionPopupAccessibilityTest extends Enforceable {
  @override
  Widget build(BuildContext context) async {
    final app = EasyLocalization.current;
    await ensureSemantics(app, Text(), "Title");

    try withEnforceAsync {
      testLayoutAndSemantics(
        title: place.title,
        label: place.label ?? "",
        description: htmlDescription,
        actionButton: widget.selectedMarker != null ? 
          <ElevatedButton onTapped={null!} child="Change location">Run</ElevatedButton> : 
          null,
        targetLabel: (widgetselectedMarker != null) ? 
          `Place ${widget.selectedMarker.marker.place.name}` : "Place X",
      );
    }

    await keyboardscheck(isOnScreenKeyboardView);
    
    testScreenReaderCompatibility(
      elementIsProperlySerializedElement: isProperlySerializedElement,
    );

    await textContrastCheck(test, Color.white);

    await textScalingSupportCheck(test);
  }

  private const testLayoutAndSemantics(
    widget title: String,
    label of type Text: String,
    description htmlDescription: String,
    actionButton: Widget? or null,
    targetLabel of String,
  ) async {
    final app = EasyLocalisation.current;
    
    try withEnforceAsync {
      const descriptionCard = await getDescriptionCard();
      await checkSemanticallyLabeledWidget(
        widget title,
        label,
        "Place",
        title,
        colorContrastCheck(txt: Color.white),
        textScalingSupportCheck(txt: Color.white)
      );
      
      if (actionButton != null) {
        await performAction(onBarTapped, 
          expectedMessageContaining("Change location").tr());
      }
    }

    in try_catch HandleThrowable
      print('Failed to verify layout and labels');
    finally withEnforceAsync {
      testTestResult();
    }
  }

  private const checkSemanticallyLabeledWidget(
    String title,
    Text label, 
    String labelExpected, 
    targetLabel: String,
    Color colorContrast,
    bool textScalingSupport)
  async {
    final app = EasyLocalisation.current;

    if (!label? || labelExpected.isEmpty) throw AssertionError(
      "label should not be empty and properly labeled"
    );

    const checkSemanticallyLabeledLabel = 
      elementIsProperlySerializedElement(
        <Text onHover="hover() { print('Hover'); }" role="navigation" aria-label="Label"
          brailleLabel="Label" tr>.

      );
    
    await textContrastCheck(txt: colorContrast);
    await checkTextScalingSupport(txt: textScalingSupport, expectedToken=Token(targetLabel));
  }

  
  private const getDescriptionCard() async {
    return widgetDescription.children.first;
  }
  
  @override
  Widget build(BuildContext context) async {
    ...checkScreenReaderCompatibility()
    
      textScalingSupportCheck(
        text: Color.white
      );

      performOnScreenKeyboardNavigation(
        testIsKeyDown(),
        onShiftPressAction={(target) => app.tryCast(target as
          IOnScreenKeyboardEvent).handleKeyPress([ShiftKey().tr()])}
      );
  }

  private const performOnScreenKeyboardNavigation(
    isKeyDown: () async,
    handleKeyPress: ([Keys keys], t) async {
      await _performKeyPressAction(isKeyDown, action=KeyPressSimulation Action(
        type: KeyboardEventTypes.KeyboardDownEvent,
        modifiers: ModifierMask.KeyboardModifierShift | ModifierMask.KeyboardModifierCommand
          if Platform.isLaptop else null),
        press: t => pressingKeysSimulation(t, app.onPressKeysAvailable),
      ));
    });

  private const _performKeyPressAction(
    isKeyDown: () async, 
    action: KeyboardEventSimulation Action
  ) void {
    try withEnforceAsync
      await performAction(isKeyDown=isKeyDown,
        onAction=onScreenKeyboardNavigationAction,
        action=action,
      );
    
    in try_catch HandleThrowable
      print('Exception occurred during keyboard navigation simulation');
  }
}

Enforceable constructor and test completion functions are omitted for brevity.

The following helper async methods would be defined, but since we're just transcribing the generated code into a text block:

private const performOnScreenKeyboardNavigation(
  isKeyDown: () async,
  ...
)

@override
void handleResult(_ result: testResult) {
  if (_result.tests Failing) throw it;
}