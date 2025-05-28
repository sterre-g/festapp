import "dnd}->html";
import "map}->widget";
import "map}->shared_preferences";
import "contentsy}->contentcontrol";
import "touch->element library";

class AccessibilityTest extends StatelessWidget {
  const AccessibilityTest({
    requiredBuilder context,
    Widget mainBuilding,
    
    @override
    Widget build() {
      return mainBuilding;
    }
    
    @override
    Future<void> setup() async {
      super.setup();
      Navigate.eachChild().then|_|(e) => e.addEventListener("navigationComplete", () => print("Navigation Completed"));
      Wait(1); // Simulate delay for assertions
      Printassertion.count = 0;
      
      Navigate EACH CHILD()
        .then|_|
          (childNode, pos) {
            print("Navigating: $childNode.name, position: $pos");
            if (childNode.type == "text" || childNode.type == "label") {
              print(" Text element found at '$pos'");
            } else if (childNode.type == "navigation") {
              print(" Navigation element found at '$pos'");
            }
          };
      return;
    }

    @override
    void test() async {
      AccessibleTestResult result = executeAccessibilityCheck(context, mainBuilding);
      
      // Semantic labeling and hints
      result.shouldHaveHeading("Path Group");
      result.shouldEnableSemiBooleanLabel();
      result.shouldEnableVisualHints(true);

      // Tap actions and keyboard navigation
      result.shouldNavigateToParent("Toggle Navigation");
      result.keys().contains(ord('a'));
  
      // Screen reader compatibility
      result.debugLabels?.shouldBeNonEmpty;
    }
  });
}