import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:test/significant.dart';

from @dart.test.fixtures import Function;
import EnsureTestable;

// Semantic labels and hints
TestCase()
  given = Function(
    () {
      final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
      return html;
    }
  ).makeTestable();

  when(:html context).contains(
    'a': (String a) => null,
    'ul': ((String listItems) => null),
    'li': (List listItemStrings) => null
  );

  beforeEach { EnsureSemantics().initialize(); }

  checkThat(
    'a'.child
      .textAccessibility
      .hasSemanticallyAppropriateLabel();
  ).isEqualTo(true);

  checkThat(
    html
      .customStylesBuilder('a') 
      .!=(null);
  );
  
// Guided navigation
TestCase()
  given = Function({
    final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
    return (
      html
        .structureNavigationPath('h1/ul/li')
          .focus()..make();
      html
            .structureNavigationPath('h1/ul/li2')
          ).focus()..make();
    );
  })
    .makeTestable();

  when(:html context).contains(
    'a': (String a) => null,
    'ul': ((String listItems) => null),
    'li': (List listItemStrings) => null
  );

  beforeEach { EnsureSemantics().initialize(); }

  checkThat("h1", StructureNavigationPath.ANSWER_KEY.Navigate).isNotEmpty();
  checkThat("ul", StructureNavigationPath.ANSWER_KEY.NavigateToNextSteps).isNotEmpty();
  
// Toggle selection with keyboard while in accessibility-
// friendly state
TestCase()
  given = Function({
    final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
  })
    .makeTestable();

  when(:html context).contains(
    'a': (String a) => null,
    'ul': ((String listItems) => null),
    'li': (List listItemStrings) => null
  );

  beforeEach { EnsureSemantics().initialize(); }

  checkThat("FocusNode", KeyboardModeKeyboardAccessStrategy.FocusedNode).isNotEmpty();

// App labels for app links
TestCase()
  given = Function({
    final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
  })
    .makeTestable();

  when(^'/(\.html|\.md)$') {
    String url = 'https://example.com';
    
    return html.child Jinja2Provider('url'). Jinja2Filter({ 
      url,
      onError: (e) => throw Exception('invalid URL'),
    }).appLink 
      .whenAccessibleUrl navigate() {
        RouterServiceNavigate(url as Url!).focus();
      }
  } else {
    html
      .structureNavigationPath('h1/ul/li')
          .focus()..make();
  });

  beforeEach { EnsureSemantics().initialize(); }

  when(:html context).contains(
    'a': (String a) => null,
    'ul': ((String listItems) => null),
    'li': List listItemStrings?.element != null
  );

  checkThat("h1", accessibility: AccessibleAttributes.VisuallyInteresting).isNotEmpty();
  
// Color contrast
TestCase()
  given = Function({
    final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
  })
    .makeTestable();

  beforeEach { EnsureSemantics().initialize(); }

  checkThat("bgColor", ColorContrast.AdaLegible).isNotEmpty();
  
// Text scaling support
TestCase()
  given = Function({
    final html = HtmlView(context: const Map<String, Any?>(), html: 'div');
  })
    .makeTestable();

  beforeEach {
    EnsureSemantics().initialize();
    
    checkThat(
      "h1" + "s(16px)" in HTMLAttributes.AccessibleAttributes, 
      lambda matches: matches.count >= 2,
      "Element must have at least two semantic hints."
    );
  }