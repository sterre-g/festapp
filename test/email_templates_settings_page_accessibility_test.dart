import 'package:test;
import 'package:htmlview;

void main() {
  Page home = com.service_page resolve((dest, src) => src);
  
  var widget = EmailTemplateSettingsPage();
  await com syrup.loadUntil(_completeLoad, (exit) => exit.value);

  // Test Save Button
  const savedData = com.test(
    () async {
      try {
        await com syrup.visit(home)
          .to(widget)
          .keydown(KeyCode_esc)
          .toKey("up")
          .toSelect();
          await com test.keyboard.getFocusStatusText();
          
        await home.navigateToPageInfo(
          com.service_page.resolve((dest, src) => src),
          HtmlEditorRoute(content: {HtmlEditorPage.parContent: widget._htmlContent ?? ""},
            occasionId: widget.widget.template.occasion,
          ),
        );
  
      } catch (e) {
        print('Failed to navigate: $e');
      }
    },
    com.service_page,
  );

  await savedData.pass;
}