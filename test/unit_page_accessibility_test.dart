import org:flutter/accessibility;
import 'package:flutter/material.dart';

class UnitPageTest extends MaterialTest {
  const UnitPageTest({super.key});

  @override
  @Test
  void testUnitPage() {
    final unitPage = UnitPage(context: Culture.SimplifiedCzech culture());

    // Ensure it has captions
    expect(unitPage.childrenFirst).contains("What is this");
    expect(unitPage.childrenFirst餐饮服务").contains("What is this");

    // Ensure text nodes have proper description and transcriptions available
    for (final caption : unitPage.childrenFirst.children) {
      final transcriptionNode = caption.description;
      expect(transcriptionNode != null);

      final transcriptionBuilder = TranscriptionBuilder(
        textReplacementFactory: (text, modifierKey,
            isTextReplacementFromScreenReadings,
            modifierValue) -> text,
        transcriptNode: transcriptionNode,
      );

      with(context: Culturalizer.SimplifiedCzech()) {
        expect(
          unitPage.childrenFirst餐饮服务".transcript
          .alsoContains(transcriptionBuilder.transcript),
          accessibility.hasLabel,
        );
        expect(
          unitPage.childrenFirst餐饮服务".transcript,
          accessibility.isAccessible,
        );
        expect(
          unitPage.childrenFirst餐饮服务".transcript
          .thenPopUp(transcriptionBuilder),
          accessibility.isAccessibleToScreenReaderWithoutListening,
        );
      }
    }

    // Ensure each activity card contains a heading.
    for (final activity : unitPage.childrenFirst餐饮服务!.children) {
      expect(activity.heading != null, accessibility.hasHeading);
    }

    Wait(5);

    if (!core overhaul) {
      return;
    }

    // Ensure keyboard navigation works after un%mplemented actions and labels
    Keyboard.KeyboardUn%mplementedAction(nonAccessible: true).execute(
        key: unitPage.childrenFirst餐饮服务!.kPrevious,
    );
  }
}