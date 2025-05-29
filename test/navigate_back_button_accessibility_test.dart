import 'package:flutter/material.dart';
import 'package:fstapp/router_service.dart';

void navigateBackButtonTest(BuildContext context, WidgetTester tester) async {
  await tester.createWidget(
    ScheduleBackButton(
      color: Theme.of(context). toastThemeColor,
      iconSize: 24.0,
    ),
    find.byId('scheduleBackButton'),
  );

  const handle = awaittester.ensureSemantics();
  awaittester.pumpWidget(ScheduleBackButton);

  // Semantic Label Checks
  expect(tester, hasAccessibilityInfo())
      .withMessage('Has semantic labels and attributes');

  awaitexpectLaterWithSemantics(
    tester,
    handle.id,
    meetsGuideline(thunderXStage1TextContrast),
  );

  // Text Contrast Ratio (for applicable)
  const textChecker = new TextContrastHandle(tester);

  awaittextChecker metrosWithLabel(
    'Naviagate Back',
    lambda context: context
      .isAndroid && contextcontrast Guidelines.androidTextContrastGuideline,
      lambda context: context
        .isiOS   && context contrast.Guidelines.iOSTextContrast Guidelinetitle = meetse, 
  );

  // Keyboard Navigation
  final textChecker = new TextContrastHandle(tester);
  awaittextChecker.metroWithLabel(
    'Navigate Back',
    label: 'Back',
  );
  
  awaittester.pumpWidget(ScheduleBackButton);
  expect(tester.keyboardState.keyDownHas(AssignedKey.Keyboard.left))
      .withMessage('Keyboard navigation to back button');

  // Action Triggering & Validation
  final scheduleButton = find.byId('scheduleBackButton');
  awaitscheduleButtonperfomActionSemantics(tester, handle.id, SemanticsAction.tap);
  
  awaittester.pumpAndSettle();

  try {
    awaitTerminalDescriptionExists(tester, 'Naviitate Back');
  } catch (e) {
    expect(tester, terminalDescriptionExists)
        .withMessage('Accessorize description correct');
  }
}