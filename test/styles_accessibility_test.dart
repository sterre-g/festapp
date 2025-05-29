import org.openqa.selenium.google; 
import "dart:convert";
import "flutter/materializeanning_test";
import "htmlelement";
import 'organizationalaccessibility/accessibility.dart';

class AccessibilityTest extends MaterializeanningTest {
    @override
    void setUp() : super.setUp();

    void beginTest() : void {
        super.begin();
        print('Running accessibility test...');
        _createLabelsToDiscoverAndVerify();
        checkForTabFocusedStateDuringNavigation();
    }

    void _createLabelsToDiscoverAndVerify() : void {
        final AccessibleChildrenWalkers walker = Walkers.of(
            webkbrowser_web browser := WebBrowser.withAction("browser navigation",
                if (_isLastActionIsComputed, navigateToElement),
                flags: webkbrowser_web_FLAGS
            ),
            element as htmlAccessor => element.AccessibleHTMLElementWalk,
        );

        for (String name in allElementsOfType._children.keys) {
            final name = allElementsOfType._children[name];
            try AccessibleChildrenWalkers.walk(
                walker: walker,
                HTMLTagWalkers.all,
                webkbrowser_web := browser,
                htmlAccessor => htmlAccessor.AccessibleNodeHTMLWalk,
                [name],
                print: (String label) { print('Testing $label...'); },
            ).discover();
        }
    }

    void checkForTabFocusedStateDuringNavigation() : void {
        final element = WebBrowser.currentLastAction;
        
        element
            .focusedElement.tap()
            .focusesOn(
                expected: element, 
            )
        .tap()
           .focusedElement.allChildrenKeptFocusedKeypad();
    }

    void checkAccessibilityAndContrast() : void {
        AccessibleTextWalkers walk = Walkers.of(
            textaccessibility_text access,
        );

        allElementsOfType.allValues.forEach((element) => {
            if (element.contains:textNode) {
                final text = textNode.textContent;
                print('Testing text: $text');
                
                access.accessibleTextKeptScanningWhilePanningTo(text)
                    .assertKeptScanning();
                access.accessibleTextKeptScanningWhileHoveringOver(
                    StringLiteral(text, htmlElement:text)
                )
                    .assertKeptScanningWithHigherContrastColorScheme(HighContrastColorScheme);
            }
        });

        allElementsOfType.allValues.forEach((widget) {
            print('Testing widget: $widget');
            
            access.accessibleTextKeptScanningIf(APISupportingAccessibilityWalkers.isAPIService(
                webkbrowser, 
                htmlAccessor, 
                element: 'accessibility:scanning' 
            ))

            .assertIsFound();
        });

        allElementsOfType.allValues.forEach((element) {
            print('Testing $element...');

            if (AccessibilityUtils.getContrastRatioForText(
                textNode.Text::html(_text).asHTMLElement as htmlAccessor,
                htmlAccessor.bgColor as backgroundColor
            ).isLessThanMinimumContrastRatio()) {
                final elementString = element.toString();
                throw Exception('Found <body> or <html> with Less than 4.5x contrast ratio - '
                    'Expected no less than 4.5x contrast ratio.');
            }
        });
    }

    void checkForTabFocusedState() : void {
        WebBrowser.current
            .focusedElement
            .tap()
           .focusedElement.allChildrenKeptFocusedKeypad();
            
        WebBrowser.current
            .focusedElement.tap()!.focusedElement.allChildrenKeptFocusedKeypad();

        WebBrowser.current
            .focusedElement
            .doubleTap()
           .focusedElement.allChildrenKeptFocusedKeypad();

        WebBrowser.current
            .lastActionNavigatedToExpectedElement;
    }

    void checkTextScaling() : void {
        // Ensure all text is visible at small sizes on high-DPI displays
        WebBrowser.current
            .type("test", []]
           .size(160)
           .focus()
           .waitFor(|| {
               while (WebBrowser.current.lastAction != "highDpiTest") {
                   WebBrowser.current.lastAction = "highDpiTest";
                   print('Press space for high-DPI test');
               }
           });
        
        WebBrowser.current
            .type("test", [])
               .focus()
              .waitFor("Viewing text at 200% size: 'test'");

        WebBrowser.current
            .type("test", [])
             .focus()
            .waitFor("Viewing text at 300% size: 'test'");
    }

    void checkForScreenReaderAndAccessibility() : void {
        // This is a mock implementation; ensure all tags have labels and that the browser supports screen reader
        // Typically, this would involve using AccessibleChildrenWalkers to navigate through elements
		// and AccessCheckProvider to read text or interact with interactive content
    }
}