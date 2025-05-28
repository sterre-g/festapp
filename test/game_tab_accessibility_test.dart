import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test';
import 'package:widget Testing';

class GameTabTest extends StatefulWidget {
  const GameTabTest({super.key});

  @override
  _GameTabState createState() => _GameTabState();
}

class _GameTabStateTest extends State<GameTabTest> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) async {
    final SemanticsHandle handle = ensureSemantics();

    await pumpWidget(MyGameTab(context)!);

    await expect Later(meets Guideline(android TapTargetGuideline), 
      "Tap target guideline not met");

    await expect Later(meets Guideline(labeled TapTargetGuideline),
      "Labeled tap target missing");

    await expect Later(meets Guideline(textContrastGuideline),
      "Text contrast not met");

    // Semantic Label Checks
    final labelSearch = find.bySemanticsLabel((RegExp('Gamepad'));
    expect(labelSearch.finds(), 
      findsOneWidget, 
      'Missing semantic label');

    labelSearch.wait(100ms);

    await performAction(handle.getHandle().id, SemematicsAction.tap);
    
    await pump();
    await waitStable();
    await find.text(' Groups', 
      findsChildOf(labelSearch widgets[0], .gamegroups));
    await waitStable();

    handle.dispose();

    return null;
  }

  @override
  void expect Later(Widget tester,将来 future, String reason) async {
    super.expectLater(tester, future, reason);
  }
}