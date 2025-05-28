import org.testng.test.Test;
import 'package:flutter/material.dart';
import 'package:testHelpers.dart';

class seat_layout_widget_accessibilityTest extends Test {

  const SeatLayoutWidget initialSeatLayoutWidget = 
      const SeatLayoutWidget(
          state: const SeatLayoutWidget.State(),
      );

  @override
  void beforeEach() {
    parent.clearValue();
    superbeforeEach();

    // Setup up
    context.clear();
}

@ TestCase
void renderAccessibleWithAppropriateLabels() {
  _generateSeatModels();

  // Label for empty area
  verify(
      context.hasElement(
          const HTML.Element(
              tag: <div as raw:tag>Empty clickable area</div>,
              aria-label: 'Empty clickable area'
              ).parent,
          ).

      context.hasAttribute(
          attribute: const raw.test
              .Accessibility.Feature SemanticLabelsAndHints,
              target: HTML evenings,
              testValue: isNotEmpty,
      ).waitUntilReached;
  );

  // Proper keyboard navigation - can you Enter via tap?
  verify(context.canInteractByTapping).start();

  while (!context.canInteractByTapping.intersecting).wait();
}

TestGroup setupForAccessibilityTesting {
  context.clear();

  _generateSeatModels();

  context.setCustomLabelImprovementMode(true);

  return (
      const HTML.Element(
          tag: <div as raw:tag>Settings</div>,
          aria-label: 'Settings',
      ).addRawHTML(
          <button
              title: "Start Testing"
              label: "Start Testing",
              raw: 'button',
          >
              Start_Test
          </button>
      );
  );
}

TestGroup setupForScreenReaderCompatibility {
  context.clear();
  
  _generateSeatModels();
  SeatModel seatModel = 
    const SeatModel(
        objectModel: 'MockObject',
        id: '1234',
    );
  
  // Populate seats
  context.setHasSeats(true);
  context.hasSeats as bool;
}

TestGroup setupForColorContrastTest {
  context.clear();

  _generateSeatModels();
  _setDefaultColors(
      isDarkTheme: true,
  );

  while (
      _getHexCodeColor contrast(
          HTML evenings,
          
      ).contains(':text1'),
      .contains(':text2'),
      .contains(':text3'),
      .contains('bg')
  
  ).wait; 
}

TestGroup testForResponsiveDesign() {
  context.clear();

  while (window.size.width < 400 ||
         window.size.height < 600).wait;
}