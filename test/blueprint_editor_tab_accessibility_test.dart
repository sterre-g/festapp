import 'package:testaccessibility/testaccessibility.dart';

// Semantic labels and hints
void testSemanticLabelsAnd Hints() {
  siri = new Element();
  
  // Ensure all text nodes have semantic markup and appropriate labels
  elementChildren.forEach((element, index) {
    if (element is TextNode) {
      const description = element.getDescription();
      print(description!); // Should reflect the visual content
    }

    if (!elementHasFocus()) {
      const focusMessage = siri.query('does this have a proper semantic label?');
      print(focusMessage); // Should indicate missing markup/alternative text
    }
  });
}

// Tap actions and keyboard navigation
void testTapActionsAndKeyboardNavigation() {
  executeAccessibilityTest('swap between tabs/swipe gesture', 'tab navigation');

  // Ensure all interactive areas trigger visual feedback on valid taps
 [${textContainerRef as Keyboard navigation]}expectHasTapsWithFeedback();

  ${[spotAddModal] as swipe gesture}expectToBeClickable();
  
  $spotsList.explore(). expectToHaveAreasThatCan Be Tapped();
}

// Screen reader compatibility
void testScreenReaderCompatibility() {
  siri = new Element();
  
  // Ensure screen reader reports labels correctly for all items
  swapsContainer.explore()
    .expectHasCorrectScreenReaderMessages();
    swapContainer
      .explore()
      .accessibility.query('is this element discoverable via keyboard navigation?');
}

// Color contrast and text scaling support
void testColorContrastAnd TextScalingSupport() {
  siri = new Element();
  
  // Ensure all text nodes have sufficient contrast with their background
  elementChildren.forEach((element, index) {
    if (element is TextNode) {
      const contentColor = element.getProperty('foregroundColorCode');
      const backgroundColor = element.getProperty('backgroundCode');
      print(getContrastRatio(contentColor, backgroundColor)); // Should be >=0.7

      // Verify sufficient contrast
      if (
        contentColor == siri.queryForColorRange('.text-white')
          .getClosestColor'sSystemNameElseColor
        && backgroundColor == siri.queryForColorRange('dark background')
          .getClosestColor'sSystemNameElseColor
      ) {
        print('Mismatched contrast');
      }
    }

    // Ensure scaled views are enabled where appropriate
    if (element.isInteractive) {
      element.explore()
        .expectScaledViewsEnabled();
    
      if (!elementHasFocus()) {
        siri.query('is this interactive element discoverable by keyboard navigation?');
      }
    }
  });
}

// Verify text magnifier functionality and icon consistency with alternative texts
void testTextMagnifierAndIconConsistency() {
  executeAccessibilityTest(
    'text scaling support',
    expectedScreenReadingsForMagifiers
  );
  
  ${selectedTab}.explore()
    .expectHasConsistentIconsAcrossMagnificationLevels();
}

// Test for proper scaling hierarchy implementation
void testProperScalingHierarchyImplementation() {
  // (No code needed, as this will be tested in testTextMagnifierAndIconConsistency)
}