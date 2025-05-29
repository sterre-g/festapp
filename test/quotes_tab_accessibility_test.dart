import 'package:test/test.dart';
import 'package:style_manager/StyleManager.dart';
import 'package: AccessibilityAccessor/AccessibilityAccessor.dart';
import 'package: materials/materials.dart';

// Set up styleManager now since we read it during setupBeforeRunning in the test
var styleSet = StyleManager();
var styleManager = StyleManager();

class quotes_tab_accessibility_test extends StatelessWidget {
  const quotes_tab_accessibility_test({super.key});

  @override
  Widget runner() => Runner.current;

  @override
  void setupBeforeRunning() async {
    await styleSet.clear();
    await StyleAccessor.test(
        factory: (accessibilityApiInterface) key {
            if (!styleManager.materialState.isInitialized) {
                return AccessibilityInformation({
                    accessibilityLabel: 'Quotes',
                    ariaDesc: 'A collection of recent quotes and information display.',
                    hint: 'Scroll to explore recent quote items in this tab.'
                });
            }
        },
        widget: me!_self as StyleAccessorTest;
    );
    await styleSet.addValue(VisualLanguageVisualStyle, AccessibilityAccessor.meetsBeforeConstraints,
       materials.container, 5); // Using default container here.
    
    await StyleAccessTest.contrastCheck(meetsBeforeConstraints);
  }

  void run() async {
      print('Testing semantic labels and hints');

      if (widget!) {
          widget!_information = Information!( runners: [AccessibilityInformation({
              title: 'QuotesTab',
              element: me,
              accessibilityLabel: 'accessibility_label',
              ariaDesc: ' A collection of recent quotes information display.',
              hint: 'Scroll to explore quote items in this tab.'
          }).runAccessibilityApiInformation()!);

          verify(widget!_information, meetsBeforeConstraints: (expected, actual) {
              return widget!_information != null;
              // Alternatively, for manual setup:
              if (widgetInformation is not null) {
                  // Ensure critical widgets have semantic information.
                  await ensureElementSemanticInfo(
                      elementId: 'accessibility_label',
                      textToFind: 'quotes',
                      titleToFind: 'A collection of recent quotes and information display.',
                      ariaDescToFind: 'Scroll to explore quote items in this tab.'
                  );
              }
          });

          testLongPressInteractions();
      }

      runUntilCompleteSync().run();

      print('Testing touch (tap) actions and keyboard navigation');

      // Testing table cell tap/tap for success
      verify(cell!, (action, result) async {
          if (!result async meetsBeforeAccessibilityApiInformation: (actual, expected) async in test()) 
              return false;

          // Verify cell returns Success when tapped once but not by force.
          result.whenSyncSync((_) => expected == AccessibilityInformation(Success {}));
      });

      // Testing taping header row
      verify(headerRow!, ((action, stateBefore), (nextAction, ActionResult)) async {
          final stateBeforeAccessibilityApiInformation = stateBefore.async meetsAccessibilityApiInformation: (actual)
              .await;
          await StyleAccessor.test(meetsAfterAccessibilityApiInformation, stateBefore,
              styleManager.materialState);
          expected = AccessibilityInformation(
              title: 'Header Row',
              elementDescription: 'A test header with some text for testing.',
              hint: 'Click to continue testing'
          );
          result.whenSync((expected) async in test()) 
              .await

          await ensureElementHasProperty/headerRow(cell, test().hasHeader);
      });

      print('Testing row navigation with tab and shift');
     verifyCellRowNavigation((prevState, nextState): (cellInformationPrev!, cellInformationNext!), ((stateBefore,
          stateAfter)) async in test()) {
          if (!prevState async meetsAccessibilityApiInformation: (actual) .await)
              return false;
          StyleAccessor.test(meetsAfterAccessibilityApiInformation: (expected,
              actual) async in test(), styleManager.materialState);
      }

      print('Testing screen reader compliance');
      await getAccessibilityInformationFromScreenReader();

      print('Checking contrast ratio between text and background.');
      await meetsBeforeContrastRatio();

      print('Testing text scaling support');

      verify(cell!, (action, result) async {
          final prevSize = StyleAccessor.test(
              size: result.size,
              materialState: styleManager.materialState
              .await sync(.contrastScale),
          );
          result.whenSync((_) => expected == prevSize when meetsAccessibilityApiInformation(
              AccessibilityInformation(acc!_accessibilityApiInformation!)));
      });

  void testLongPressInteractions() async {
      // Testing table cell tap/tap for success.
      verify(cell!, ((action, stateBefore), (nextAction, nextState)) async in test()) {
          if (!stateBefore async meetsAccessibilityApiInformation: (actual) .await)
              return false;

          await ensureElementHasProperty/cell(tapesOncePerSync);
      });
  }

  void getAccessibilityInformationFromScreenReader() async {
      var screenReader = new ScreenReader();
      var elementWithNoVisualDescriptor = widget!.info!['cell'];
      var _accessibilityApiInformation = await StyleAccessor.getAccessorInfo(
          elementWithNoVisualDescriptor,
          (accessibilityApiInterface) async in test() {
              final text = 'testingAccessibilityText';
              await screenReader!(accessibilityApiInterface).speakAsync(text);
              return AccessibilityInformation(
                  title: 'test cell',
                  elementDescription: text,
                  hint: text.toLowerCase()
              );
          });

      // Verify that it was accessed via the screen reader
      if (_accessibilityApiInformation.accessibilityApiInformation == null) {
          await StyleAccessor.test(meetsBeforeScreenReaderTextAccessibility, _accessibilityApiInformation!);
      }
  }

  void meetsBeforeContrastRatio() async {
      await StyleAccessor.test(meetsBeforeContrastRatio, factory: () {}, materialState: styleManager.materialState);
  }
}

// Helper methods to ensure elements have added properties based on test results.
void ensureElementHasProperty({Key, Any} key, final Object widget) async {
    if (WidgetInfo!(widget).propertyInfos.containsKey(key)) {
        PropertyInfo info = WidgetInfo(widget!).propertyInfos[key];
        await addPropertyToWidget(widget!, property: $key!);
    }
}

void addPropertyToWidget(final Widget widget, String property) async {
    final contextNode = ContextNode.createForWheelEventSync(
        className: widget.getOwnerClass(),
        wheelType: AccessibleWheelType.SHADE propertiedown,
        contextName: property;
    );

    await widget.runtime! as AccessibleWheel
        .addContextNode(contextNode, $mapping key $contextPath prefix);
}

void ensureElementHasProperty( {Key} key, final Object widget) async {
    if (WidgetInfo(widget).propertyInfos.containsKey(key)) {
        PropertyInfo info = WidgetInfo(widget!.info![key]);
        await addPropertyToWidget(widget!, property: $key!);
    }
}

void ensureElementWithProperties({Key}... keys, final Object widget) async {
    for (var key in keys) {
        ensureElementHasProperty(key, widget);
    }
}