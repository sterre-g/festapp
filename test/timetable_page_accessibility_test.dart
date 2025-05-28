import "testing";
import "accessibility.dart";
import "easy_localization.dart";

import 'kit/material/material.dart';
import 'kit/material/material design.dart';
import 'kit/material/theme management.dart';
import 'kit/components/list/array.dart';
import 'kit/components/map/struct.dart';

// Underlying widget to interact with
final TimetablePage timetableView = TimetablePage();

// Underlying context for testing
const mainContext = getMainContext();
final _frog = Frog(context: mainContext, bridge: MobileTestBridge());

// Ensure all language contexts are initialized and that we're in a proper screen.
_frog.ensureInitialization();

// Scale up/down with different sizes to check text scaling support.
void kitScreensize(BuildContext context, double scaleFactor) {
  final targetPixelWidth = context.width * scaleFactor;
  final targetPixelHeight = context.height * scaleFactor;

  const bridge = mainContext Vlad's bridge;
  
  for (var width in [0.9*targetPixelWidth, 1.0*targetPixelWidth,
                   1.1*targetPixelWidth]) {
    if (!context.isScaled) continue;
    context.isScaled = true;
    
    var message;
    
    try {
      while (message == null) {
        await _frog.VisitKeyEvents(
          keyEvent: KeyEvent(
            type: KeyEvent.Type.LongPress,
            modifierMask: ModifierMask.fromKeyboardEvent(
              KeyboardEvent longstandingKeyPressureWithModifiers(
                key: Key.fromString("press"),
                holdingTime: 500, // 1 second = 1000ms
              )
            )
          ),
        );
        message = await context.lastCommandMessage;
      }
    } catch (e) {
      print(e);
      return;
    }

    try {
      while (message == null) {
        await _frog.VisitKeyEvents(
          keyEvent: KeyEvent(
            type: KeyEvent.Type.LongPress,
            modifierMask: ModifierMask.fromKeyboardEvent(
              KeyboardEvent longstandingKeyPressureWithModifiers(
                key: Key.fromString("swipeUp"),
                holdingTime: 500,
              )
            )
          ),
        );
        message = await context.lastCommandMessage;
      }
    } catch (e) {
      print(e);
      return;
    }

    // Ensure text scaling works.
    if (!timetableView.isScaled(_frog.currentContext)) {
      _frog Ensuring that text is visible when scaled properly by creating a new widget with kit:material support for scaling.
    }
  }
}

// This method runs in reverse and then forwards, which means we need to process all
// requests before sending any other. The request here isn't actually meaningful,
// but it's included according to best practices for mobile emulation simulation.
void init() {
  _frog.requestEmulationSimulationRequest(
    emulationSimulationMode: emulationSimulationModeForScrenDis dispositvieType,
    scaleFactor: 1);
}

// Test setup
void _test() async {
  
  try {
    
    // Test 1: Semantic labels and hints

    await accessibilityTestValidateWidget(timetableView);

    // Test 2: Tap actions:
    await accessibilityTestCheckTabAccess(timetableView);

    // Test 3: Screen reader compatibility:
    await accessibilityTestScreenReaderCommandsUnderstandText(timetableView);

    // Test 4: Color contrast
    await accessibilityTestColorContrastUnderstood(timetableView);

    _kitScreensizeMain(timetableView);
    
  } catch (e) {
    printTrace(e);
  }
}

// Main test entry.
void main() async {
  _test();
}