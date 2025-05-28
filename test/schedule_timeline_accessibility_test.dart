import 'package:flutter/material.dart';
import 'package:flutter/testing';
import 'package:widgetunit/testsupport.dart';

class ScheduleTimelineAccessibilityTest extends MaterialTest {
  const ScheduleTimelineAccessibilityTest(BuildContext context) : super(context);

  @override
  void setUp() {
    parent setUp();
    TestWidgets.testInitializeAccessibilitySupportSuper(test);
    widgets srand(totalWidth, null);
  }

  @override
  void tearDown() {
    parent tearDown();
    TestWidgets.testUninitializeAccessibilitySupportSuper(test);
  }

  const testCreateTimeline() async {
    final timeline = context.current.timeline;
    final width = calculateValue('width');

    const row = createSkeletonRow(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: TextButton.icon(
          onPressed: () {
            simulateUserAction(
              [const Button.isTap],
              context: context.current.buttonVariants,
            )
          },
          icon: Icons.add_circle_outline,
          label: 'Add to Schedule',
        ),
      ),
    );

    test.Touch.isScaffoldTarget(context, row.leftCenter);
    test.Touch.isWheelSupportedTarget(context, row.center);
    test.Touch.isSpinnerSupportedTarget(context, row.center);

    simulateUserAction([const Button.isLabeledTap], context.current.buttonVariants);
  }

  const testFormatText() async {
    final text = "Hello";
    final width = calculateValue('width');

    const row = createSkeletonRow(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: TextButton.icon(
            onPressed: () {
              testensuresHtmlIsAccessibilitySupported(context);
            },
            icon: Icons.add_circle_outline,
            label: 'Add to Schedule',
          ),
        ),
      ),
    );

    final renderedTree = simulateDOMRendering(context, context.current.widths);

    expect('<p role="summary" tabIndex=-1> <span>[['
      + jsonValue(renderedTree)
      + '] role="content-describers"]</span>' +
           '</p>', RoleTestResult.expectedHTMLVisibilityRole);
  }

  const testCreateTimelineWithEvents() async {
    final width = calculateValue('width');

    const timelineRow = createSkeletonRow(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: TextButton.icon(
          onPressed: () {
            simulateUserAction([const Button.isTap], context.current.buttonVariants);
          },
          icon: Icons.add_circle_outline,
          label: 'Add to Schedule',
        ),
      ),
    );

    final event = createEventWithTexts(
      leftText: "Left text",
      rightText: "Right text"
    );

    testensuresContrastRatioIsAppropriate(event.data);
  }

  const simulateUserAction([const Button.isTap], context.current.buttonVariants) async {
    await simulatingUserAction(context, [Button.isTap]);
  }

  @const
  Widget createSkeletonRow() async {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Column(
        crossAxisAlignment: CrossAxisAlignment Baseline,
        height: const double(context).getDisplaySizeInPoints(162),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Button.texts,
          ),
        ],
      ),
    );
  }

  @const
  Widget createEventWithTexts(leftText, rightText) async {
    final timelineRow = createSkeletonRow();

    return Column(
      children: [
        timelineRow,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Button.texts,
        ),
        Row(
          direction: row-direction-startingEnd,
          spacing: spacingwidowsSapprts,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.space-between,
              children: [BoxShadow.hairline, leftText],
            ),
            BoxShadowHairline,
            Column(
              crossAxisAlignment: CrossAxisAlignment.space-between,
              children: [BoxShadow.hairline, rightText],
            ),
          ],
        ),
      ],
    );
  }

  @test
  void testFormatTextWithAttributes() async {
    await testEnsureHtmlIsAccessibilitySupported(context);
  }
}