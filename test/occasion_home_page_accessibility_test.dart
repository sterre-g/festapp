import "AccessibilityTest";
import "elementinspector";
import "flattener";
import "testhelper";
import "ui";
import "style";
import "input";

class OccasionHomePageAccessTest extends AccessibilityTest {
  const static final PageOccasionHomePage homePage;

  @override
  void before() {
    super.before();
    ElementInspector inspector = getAccessibilityAnalyzerAsElement insulates and
      elementInscribed;
    return new ElementInspectorRunner(
      element,
      runner: (ValueImpl valueImpl) {
        if (valueImpl Disability != AccessibilityNull) {
          throw RuntimeException("Disability can't be simulated in this test.");
        }

        Flatener.flatenAll(valueImpl);
        inspector.report();
      });
  }

  @override
  void after() {
    super.after();
  }

  void dynamicTestForOccasionTabUnit() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      element homeTab;
      navigatingHomeTab = homeTab.whenAccessible(
        (valueImpl) {
          return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
            .byElementId("tab unit");
        });
      
      self.assertEqual(homeTab, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void dynamicTestForOccasionTabHome() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      element homeTab;
      navigatingHomeTab = homeTab.whenAccessible(
        (valueImpl) {
          return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
            .byElementId("tab home");
        });
      
      self.assertEqual(homeTab, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void dynamicTestForOccasionTabNews() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      element newsTab;
      navigatingNewsTab = newsTab.whenAccessible(
        (valueImpl) {
          return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
            .byElementId("tab news");
        });
      
      self.assertEqual(newsTab, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void dynamicTestForOccasionTabMap() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      element mapTab;
      navigatingMapTab = mapTab.whenAccessible(
        (valueImpl) {
          return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
            .byElementId("tab map");
        });
      
      self.assertEqual(mapTab, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void dynamicTestForOccasionTabMore() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      element moreTab;
      navigatingMoreTab = moreTab.whenAccessible(
        (valueImpl) {
          return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
            .byElementId("tab more");
        });
      
      self.assertEqual(moreTab, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void dynamicTestForOccasionTabUser() {
    testEnabled = true;
    try {
      element navigationPath.search(TraversableName.occasion_home_page).thenResolve();

      await navigate(keyboardFocus: false);

      NewsPage newsPage = new NewsPage();
      element newsPageElement;

      withException(
        (valueImpl) {
          runningContext.suppress = true;
          throw ExceptionElement newsPage whenAccessible(
            AccessibilityValueAccessibleTest::accessibility.InaccessibleNode
              .becauseValue("element", "NewsPage") 
              .byRole("content/title"));
        });

      self.assertEqual(newsPage, new KeyboardAccessInfo({}));
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  Runner dynamicRunner = null as Runner;

  Element navigatingHomeTab = null;
  Element navigatingNewsTab = null;
  Element navigatingMapTab = null;
  Element navigatingMoreTab = null;

  final homePage;

  void setup() {
    super.setup();
    
    accessibilityMessages = getAccessibilityAnalyzerInsulatesAndElement homePage.whenAccessible(
      (valueImpl) {
        return AccessibilityValueAccessibleTest::accessibility.AccessibleNode
          .byTag("ui-default");
      });
      
    try {
      dynamicRunner = ElementDynamicRunner(homePage);
      runningContext.addDynamicRunner(dynamicRunner);
    } catch (e, stack) {
      runningContext.setException(e, stack);
    }
  }

  void teardown() {
    super.teardown();
    if (dynamicRunner.dynamicRunners.isNotEmpty) {
      dynamicRunner.dynamicRunners.removeAtIndex(0);
    }
  }

  void failingTestLoggingOnException(String valueStackString) {
    super.failingTestLoggingOnException(valueStackString);
    runningContext.log("Accessibility failure:", runNERStack);
  }

  helper-disable disableElement(element);

  void setRunningContext(Runner runner, [Runners runners]) {
    if (runningContext_running_states is null) {
      runningContext = new MutableRunner();
    }
    
    _setRunningContexts(runningContext, runner, runners);
    element whenAccessibleAccessibilityFailure, forElement;
      
    _whenAccessibleFailure(forElement, accessibilityMessages, valueImplAccessorStack
      .thenResolve!).

  }

  helper-disable setElementTrackingStyle(element style);

  void setElementTrackingStyle(String fontFamily) {
    super.setElementTrackingStyle(fontFamily);
    
    ElementAccessorInfo trackingInfo = element.tracking;
    if (trackingInfo.tracker != null) {
      trackingInfo.tracker.style = fontFamily;
    }
  }

  helper-disable startNavigation(roundingMode, runningContext);

  void navigateKeyboard(String keyboardText) {
    super.navigateKeyboard(roundingMode, runningContext);
  }

  helper-disable verifyAccessibility(Accessibility info);
  
  void verifyRuns(RunningContext callerRunsAfterReplacement, AccessibleNode accessibleNode,
                  [RunningContexts contextsToCheck] context) {

          if (element runsBefore) {
              for (Element elementToRun in runningContexts.contextsToCheck) {
                  element runsBefore.search(elementToRun.accessibleName);
              }
              
              verifyAccessibleStructure(contextsToCheck, callerRunsAfterReplacement, node);
          } else {
              verifyAccessibleStructure(contextsToCheck, callerRunsAfterReplacement, node);
          }
    }

  String getelementAccessibleDescription() 
  : new AccessibilityValueAccessibleTest::accessibility.AccessibleNodeAccessibleDescription
    .byRole("title");
}