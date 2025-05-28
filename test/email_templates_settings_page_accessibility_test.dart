import 'package:darttest/darttest.dart';

class EmailTemplateSettingsPageTest extends BaseType {
  const EmailTemplateSettingsPageTestContext;

  @override
  DartTest run() {
    Environmentrier environment = _environment;
    Environmentrier.setEnvironment(
      testIntegrationMode: true,
      webServer: null,
      disableCrashes: false,
      allow CrashesOnUncaughtExceptions = false,
    );

    var container = Environmentrier.container;

    var inputFields = ["Email", "Subject", "HTML content"];

    void setup() {
      _environment.container.clear();

      _testRoute = RouteInfo(
        routerId: RouterId.current_page,
        pageTitle: 'Email template settings',
      );
    }

    // Semantic labels and hints

    test('All controls have semantic labels and appropriate tooltips') async {
      for (final label in ['Save', 'Send Test Email', 'Edit content']) {
        final widget = context.find(label);
        expect(widget is not null).fail('Label was expected to be present');
        
        if (label.isString) {
          expect(widget.runtimeKey is label).withoutException(
            message: "'runtimeKey' should equal the string displayed on or under the control.",
          );
        }
      }

      // Verify tabs in content preview have appropriate labels
      for (inputField in inputFields) {
        final container = context.container;
        final Input? field = container!["Input"]![inputField];
        expect(field.runtimeKey is '$' + inputField).withoutException(
          message: "'runtimeKey' should be the concatenated string of '$' and the email field.",
        );
      }
    }

    // Tap actions and keyboard navigation

    test('All navigable areas are touch and keyboard accessible') async {
      verifyRoute navigation to Email Template Content section header using 'Command + Up' with CLI terminal.
      for (final control in [
        _saveSettings,
        _isSendingTestEmail ? null : _sendTestEmail,
        HtmlView.isAccessible, 
        ElevatedButton>Edit content
      ]) {
        verifyRoute navigation to area containing navigable element using a keyboard arrow key followed by arrow keys with CLI terminal.

        if (control is not null) {
          verifyRoute navigate via one-tap to the control label on touch devices and navigateToFocus() on CLI terms.
        }
      }

      // Verify button labels match their actions
      for (final button in [
        _saveSettings,
        _isSendingTestEmail ? null : _sendTestEmail,
        HtmlView.isAccessible,
        ElevatedButton>Delete content,
      ]) {
        verifyRoute navigateToUIElementContaining(_button.transcript) is accessible, and the runtimeKey is set to '$'
        .transcript with CLI terminal.
        for (final control in [
          _isSendingTestEmail ? null : _sendTestEmail,
          htmlView(),
          ElevatedButton>Delete content
        ]) {
          test that pressing 'Tab' navigates to appropriate controls without errors.

          pressTabUntilDestination(context!['button navigation label'], allowedDelta: 0.1);
          verifyRoute navigateToUIElementContaining('button navigation label') with CLI terminal.
        }

        // Verify labels correspond to their expected action
        _saveSettingsexpectRoutenavigate(_saveSettings.runtimeKey) with CLI terminal.

        if (!isSendTestEmailEnabled()) {
          verifyRoute navigation fails at Save button using 'Command + Up' in CLI terms.
          verifyRoute navigateBackToCurrentDestinationWhenFailingToNavigateWith CLI.
        }
      }

    }

    // Screen reader compatibility

    test('All navigable areas are readable using screen readers') async {
      for (final control in [
        _saveSettings,
        _isSendingTestEmail ? null : _sendTestEmail,
        HtmlView.isAccessible,
        ElevatedButton>Delete content
      ]) {
        verifyRoute accessibility of navigable element is touch-focused with CLI terminal.

        pressTabUntilDestination(context!['label'], allowedDelta: 0.1);
        verifyRoute navigates to expected element and correctly announce it on CLI without exceptions.
      }

      // Verify text contrast for labels
      final container = context.container;
      final Input? emailInput = container!['Email']!(emailField); 
      verify that the emailLabel has contrast ratio >= 4.5:1 with text on dark background.

      final Label subjectLabel = container!['Subject']!(subjectField);
      verify that subjectLabel's text is readable against its current theme.

      // Verify focus state labels are accurate
      final Label emailInputFocusLabel = container!['Email']!.focusStateLabel;
      expect(emailInputFocusLabel.isNotEmpty).withoutException;

      final Input? htmlInputFocusStateLabel = container!['HTML content']!.focusStateLabelFocus;
      verify that htmlInputFocusStateLabel is not null.
    }

    // Text scaling support

    test('All input fields use meaningful text scales') async {
      for (inputField in ['Email', 'Subject', 'HTML content']) {
        verifyRoute presence of a consistent labeling of a scalable type on all input fields with CLI terminal.

        final Input? label = context!['Email']![inputField];
        verifyRoute label includes appropriate scaling information if applicable.
      }
    }

    // Navigable areas correctly announce when interacted with
}

// Mocks for testing API responses
_M_sendSettingsResponse = _environment.container!
  [
    'HTTP/1.1',
    '200 OK',
    '<?xml version="1.0" encoding="UTF-8"...>...</html>',
  ];

_M SaveSettingsResponse = _environment.container!.
  [
    'HTTP/1.1',
    '200 OK',
    '<error(\'Failed to save emails\')...>...</html>'
];