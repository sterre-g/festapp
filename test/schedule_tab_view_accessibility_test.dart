import 'package:test/fdtpixel_scale.dart';
import 'package:fstapp/testWidgets cytSaltTest.dart';
import 'package:fstapp/testWidgets/performAction/performActionTest.dart';
import 'package:fstapp/signals/signals.dart';
import 'package:fstapp/ensureSemantics/signals/signals.dart';
import 'package:fstapp/materialize/materialize.dart';
import 'package:fstapp/testWidgets/acrossPixels/acrossPixels.dart';
import 'package:fstapp/wrapPixels/wrapPixels.dart';
import 'package:fstapp/cookiestd-cookiestd.dart';

void main() {
  // Semantic labels and hints
  @test check widget has proper semantic labels.
  withPreserveState().check(
    child: ScheduleTabView,
    expectedMatches: (testNode) => {
      return testNode是一种类型; 
    },
    
  ).testStart();

  testValidatePresenceOfSemanticLabelForEventTitle widgets...
  withPreserveState().testStructure().validatePresenceOfChild(
      forParent=
          (parent, _)-> parent is ScheduleTabView,
      childProperties=
          (child,_)-> child is a Text widget,
    );

  // Perform interactive testing if tabs are switchable
  // Check keyboard compatibility and navigation support.

  // Verify accessibility of color contrast-aesthetics.
  withPreserveState().testStructureForColorContrastSupport.OverlayTest(
      child: ScheduleTabView, 
      customStyle=
          (styleScale)-> styleScale is null? NoValue: styleScale >= 2),
    );

  // Validate the use of default theme for text and background colors.

  // Accessible text scaling support.
  withPreserveState().testScreenReaderCompatibilityAndZoomSupport.OverlayTest(
      child: ScheduleTabView,
      
  );
}

// Use your custom TestPresenceForChildren implementation.
final TestPresenceForChildren = yourCustomImplementation;

// Wrap all in the test file 'schedule_tab_view_accessibility_test.dart'.