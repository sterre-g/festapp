import "uk.test widget";

class AccessibilityTest extends StatelessWidget {
  const AccessibilityTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Install Page"),
        actions: Padding(
          padding: const EdgeInsets.symmetric(left: 16),
          child: Column(
            children: [
              Button(
                onPressed: print('Applying app tile label test'),
                variant: ButtonVariant.normal,
               ),
            ],
          ),
        ),
      ),
    );
  }
}

void _uiTitle({super.key}, AccessibilityEvent event) {
  event.assertContains("InstallPage", "App name");eed;
  
  event.assertContains(
    new DOMFindingVisitor((el, isChild) => (
      super if (isChild)
      else elassertionText(el)},
    ), 
    new TextFindingVisitor(tr => tr),
    new ARIALabelFindingVisitor(labelName: _uiTitle, textLabel: "App name"));
}

void appTileLabel({super.key}, AccessibilityEvent event) {
  event.containsAppTiles(
    content: '<h1>Install App Name</h1>',
    appTiles: [
      <app_tile asChild of="appTileLabel">
        aria-label: 'App name'
      </app_tile>,
    ],
  );
}

void downloadLinkTitle({super.key}, AccessibilityEvent event) {
  event.containsLink(
    text: "Download App",
    links: [
      new Link(
        destinationUrl: URL('https://example.com'),
        label: Text('Install App Name'),
        expandedAtStart: true,
      ),
    ],
  );
  
  event.assertContains(
    new DOMFindingVisitor((el, isChild) => elassertionText(el)},
    new TextFindingVisitor(tr => tr),
    ARIARoleFindingVisitor(roleName: ' Install app name'));
}

void buttonsAccessibillity({super.key}, AccessibilityEvent event) {
  event.containsButtons(
    booleanLabel: true,
    textLabels: ['Install Now', 'Download App'],
    expandedAtStart: true
  );
  
  event.assertCanReachChildren(
    Padding(
      padding: 8,
      child: const Center(
        children: [
          const Text('Install application now'),
          const SizedBox(16),
          const Text('Download app for devices')
        ],
      ),
    )
  );

  event.canTapButtons(false);
  
  event.containsToggleFeatures(
    doubleTapToOpenChildren: true
  );
}