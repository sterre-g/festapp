import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fstapp/components/features/feature.dart';
import 'package:fstapp/components/features/feature_form.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Guideline Tests', () {
    testWidgets('TicketFeature meets accessibility guidelines', (WidgetTester tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      final ticket = TicketFeature(code: "T1"); // Wrap with EasyLocalization and MaterialApp for tr() to work
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale('en')],
          path: 'resources/langs',
          fallbackLocale: const Locale('en'),
          child: MaterialApp(
            home: Scaffold(
              body: FeatureForm(feature: ticket, occasion: 1),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle(); // Check tap target guidelines and text contrast
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline)); // Check semantic labels via regex
      expect(find.bySemanticsLabel(RegExp(r"Ticket Type", caseSensitive: false)), findsOneWidget, reason: 'Missing Ticket Type label');
      handle.dispose();
    });
  });

  group('Semantic Action Tests', () {
    testWidgets('Switch tap toggles FeatureForm state', (WidgetTester tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      final ticket = TicketFeature(code: "T2");
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale('en')],
          path: 'resources/langs',
          fallbackLocale: const Locale('en'),
          child: MaterialApp(
            home: Scaffold(
              body: FeatureForm(feature: ticket, occasion: 1),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle(); // Find the switch widget
      final switchFinder = find.byType(Switch);
      expect(switchFinder, findsOneWidget); // Get semantics info and perform tap semantic action
      final switchSemantics = tester.getSemantics(switchFinder);
      tester.binding.pipelineOwner.semanticsOwner!.performAction(switchSemantics.id, SemanticsAction.tap);
      await tester.pump(); // After tap, the form should hide feature fields (since isEnabled toggles false)
      expect(find.byType(DropdownButtonFormField<String>), findsNothing, reason: 'Feature fields still visible');
      handle.dispose();
    });
  });
}
