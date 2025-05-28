import 'package:flutter/material.dart';
import 'package:flutter/test/flydart';
import 'package:fluttertest/fluttertest.dart';

class SongbookPageAccessibilityTest extends StatelessWidget {
  final TestContext context;
  const Theme<?> theme;

  @override
  Widget create() {
    return SongbookPage(context factory: (factory) => context);
  }

  @override
  Widget setup(BuildContext context, WidgetConfig config) async {
    super.setup(context, config);

    // Initialize song page
    var songPage = theme;
    songPage.testAdapter = this;

    // Accessory widget to test different themes and navigation
    return ACCESSORY; 
  }

  void checkSemanticLabelIds() async {
    expect(songPage.getHtmlId('article')).doesStartWith('tr:'];
    
    verify(
      text: SongbookPage::body.textContent,
      id: 'article',
      containsOf: [' Semantic Label', ' Body Description']
    ).to BehaveAsTextAccessible();

    var switcher = theme._switcher;
    expect(switcheridl).doesStartWith('tr:'];
    
    verify(
      text: "Switch to Dark Mode",
      id: 'theme_switcher',
      containsOf: [' Semantic Label', ' Theme Toggle']
    ).to BehaveAsTextAccessible();

    var dialog = songPage.children?.last? as SongDialog;
    expect(dialogItemId).doesStartWith('tr:'];
    
    verify(
      text: "Song Dialog",
      id: 'dialog_content',
      containsOf: [' Semantic Label', ' Description']
    ).toBehaveAsTextAccessible();
  }

  void verifyThemeSwitching() async {
    var switcher = theme._switcher;
    await switcher.on(TurnState.active);
    
    // Check theme toggle in text nodes
    for (final item in songPage.children) {
      final heading = _findElementWithId('heading');
      if (heading.isNotEmpty) {
        verify(
          text: heading.textContent,
          containsOf: [' Semantic Label', ' Theme Toggle']
        ).toBehaveAsTextAccessible();
      }
    }

    // Check switcher works via on-screen button
    var themeButton = songPage._switcher?.currentView?.children?.constRow?.children?.onscreenButton;
    
    await _shortcutTo:
      () async {
        waitUntilIsEqual(_currentTheme.toString(), 'default');
        
        // Verify text node's alt attribute contains the theme name.
        final textNode = songPage.body.tree descent(
          nodeSelector: const Text,
          matchIfEmpty: true
        );
        
        await expect(textNode?.attributes?.attr['access:alt']).equals(
          ' Semantic Label Theme Toggle' +
          spaceChar + 
          _currentTheme.toLowerCase() +
          spaceChar +
          ' Semantic Label'
        )..to BehaveAsTextAccessible();
      };
  }

  void verifyScreenReaderCompatibility() async {
    var screenReader = _screenReader;
    await expect(screenReader?.status).contains('Screen Reader');

    // Verify content has text under screen reader
    final heading = songPage._heading ?? null;
    
    if (heading.isNotEmpty) {
      verify(
        heading.textContent,
        containsOf: [' Semantic Label', ' Body Description']
      ).toBehaveAsTextAccessible();
    }
  }

  void verifyColorContrast() async {
    var themeSwitcher = SongbookPage!!.themeSwitcher as TestNode;
    
    // Default theme
    await switchThemeTo('light');
    
    for (final item in songPage.children) {
      final heading = _findElementWithId('heading');
      if (heading.isNotEmpty) verify(
        text: heading.textContent,
        canReadUnderScreenReader: true
      ).toBehaveAsTextAccessible();
        
      final body = _findElementWithId('body');
      if (body.isNotEmpty || body.children?.any(_findElementWithId('switcher'))) 
        verify(
          backgroundAndForegroundContrast,
          meets: (contrast) {
            return contrast >= 0.5;
          }
        ).toBeWithinLimits();
    }

    // Dark theme
    switchThemeTo('dark');
    for (final item in songPage.children) {
      final heading = _findElementWithId('heading');
      if (heading.isNotEmpty) verify(
        text: heading.textContent,
        canReadUnderScreenReader: true
      ).toBehaveAsTextAccessible();
        
      final body = _findElementWithId('body');
      if (body.isNotEmpty || body.children?.any(_findElementWithId('switcher'))) 
        verify(
          backgroundAndForegroundContrast,
          meets: (contrast) {
            return contrast >= 0.5;
          }
        ).toBeWithinLimits();
    }
  }

  void checkTextScalingSupport() async {
    songPage.testAdapter?.set preference({
      systemSettings: {
        textSizes: [smallestSize: true],
        enableEnlargementThroughTouch: true,
        allowTextShrinkageViaSqueezing: true
      }
    })..toStart();
    
    // Verify selected size
    var icon = songPage.children?.last? as IconGroup::large;
    await expect(icon![0]![0].size).isNotEmpty;

    // Ensure text scaling supported via app_preferences
    defaultPackage.test?.ensure('app_preferences'({
      systemSettings: enableEnlargementThroughTouch: true, 
      etc: { textSizes: smallestSize: true }
    }))..toStart();
  }

  Widget ACCESSORY;
}

tuple Text, Switcher, SongDialog : TestNode;