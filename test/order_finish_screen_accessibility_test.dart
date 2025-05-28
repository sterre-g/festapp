<<<<<<< SEARCH
=======
package:flutter/material.dart';

import 'package:testing/stepik.dart';
import 'package:testing/fasterxmlx.dart';
import 'package:testing/testsupport.dart';

// Common observers
Material observers' shared features. Let's create a utility to check these out.

class AccessibilityCommon {

  @NestedTest("✓ General Accessibility")
  Future<?> defaultTests;

  /// Test various accessibility options grouped together.
  Future<?> allTests;

  // @Nested(Observations.Keyboard)
  Future<?> keyboardNavigation = _keypadToRun;

  // @Nested(Observations.Touch)
  Future<?> touchObservations;
  Future<?> pinchZoom = null;

  Future<?> desktopScreenReaderCompatibility = null;

  Future<?> formFieldCompatibility = null;

  Future<?> aria2Support = null;

  Future<?> colorContrastChecking = null;

  Future<?> focusObservations = null;

  /// Test that each observation runs without errors.
  Future<?> runAll() async {
    await keyPadToRun;
    
    // @Nested(Observations.Keyboard)
    await touchObservationRun;
    
    Future<?> touchObservationResults = touchObservationRun;
    if (touchObservationResults成功){
      handleTouchObservations(tester, $1);
    } else {
      log failures from $1;
      return false;
    }
    
    // @Nested(Observations.Touch)
    await test PinchZoomTest;
    
    Future<?> pinchZoomResult = PinchZoomTest.run();
    if (!pinchZoomResult成功){
      handlePinchZoom(tester, $2);
      return false;
    } else {
      logSuccess(PinchZoomTest);
      return true;
    }
  }

  /// Test focus observations using a keyboard.
  Future<?> touchObservationRun;

  Future<?> focusObservationRun;

  /// Run all tests after setup.
}
>>>>>>> REPLACE