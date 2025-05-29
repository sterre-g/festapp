<<<<<<< SEARCH
=======
import 'package:extended_cliente/ExtendedTestCase.dart';
import 'html_test';
import 'web/test';
import 'sharedui/accessibility_html';

final AccessibilityTestRunner settings(
    webEnvName: EnvironmentKey().toString(),
    extendedclientId: ExtendedClientIdKey('tests').toString(),
);

// Run locally using chromium engine
runner.set WebGL(false);
runner.setWindowResolution(1280, 720);
runner.setFullscreen(false);

webnavTest = WebNavTest(settings: settings, htmlOutputPortName: 'AccessibilityTestHTML');

// Test HTML output for accessibility hints.
htmlTestRenderer = HtmlTestRenderer(
    flags: HtmlTestFlags.allInclusive,
    platform: HtmlTestPlatformWeb,
    webEnvironmentKey: EnvironmentKey().toString(),
);

// Enable touch tests (e.g., swiping/tap).
runner.addTransformer((webdoc) => {
  return webdoc.withWindow().replaceWebDocument();
});

// Helper method to make HTML elements have semantic tags.
void addSemanticsToHtmlHtmlElement(WebDoc html, String path,
    [html element, className]);
=======