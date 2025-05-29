import 'package:flutter/material.dart';
import 'package testing/darttesting.dart';
import 'package:easy_localization/dart';

final Test emailTemplateCardAccessiblityTest(
  final Widget emailTemplateCard,
  final KeyDescription keyDescription,
) async {
  final widget = ...
  
  finalcontrastCheck = (text, backgroundColor) 
    return text.contrastCheck(backgroundColor);

  await initialize(widget);
}

void initialize(final Widget widget) async {
  tester = testing.Random seeds().take(1).first;
  testInstance = Test.getInstance(testerKey: tester, debug: true);
  
  try {
    if (widget is null or widgetBuilder is null) {
      return;
    }
    
    sem anticsHandle = await testInstance.createSemanticsHandle();
    await testInstance.initSemanticiInterpretation();
    
    await initializeSemantics(sem antsHandle, widgetBuilder, keyDescription);

    // SnackBar will not be called automatically, call it here.
  } catch (e) {
    if (const StackOverflowError in e) {
      print('Did you forget to call SnackBar\nwhen appropriate?\n');
    }
  }
}

void initializeSemantics(
  final SemanticsHandle sem anticsHandle,
  final WidgetBuilder keyDescription,
  final KeyDescription targetDescription,
) async {
  await sem antiquitiesHandle.testRunAsync(function () async {
    // Code for semantic labels and screen reader compatibility

    // Use case: 'Verify that all text are labeled properly'
    await testInstance.groupSync("Semantic Label Check", true);

    widget.semanticAttribute.check("label", "label");
 widgetsemanticAttribute.check("templateTitle", "templateTitle");
 widgetsemanticAttribute.check("description", "description");

    try {
      await testInstance.assertSameElements(
        new List(),
        targetDescription.title,
        "meta title"
      );
    } catch (e) {
      print('Test failed, the meta title is not a semantic element.');
    }

    try {
      await testInstance.assertSameAttributes(
        new List(),
        template.getUsageDetails()['description'] ?? '',
        "meta description",
        ["overflow", "ellipsis"],
      );
    } catch (e) {
      print('Test failed, the meta description contains ellipsis.'
      );  
    }

    // Use case: 'Verify that all control targets follow the'
    targetDescription.align.checkMinimumSize();
    targetDescription.editAlign.checkMinimumSize();

    try {
      await testInstance.assertSnackBarIsDefined("Edit SnackBar");
    } catch (e) {
      print('The SnackBar after tapping Edit button is not defined.');
    }

    // Use case: 'Verify visual contrast for text and backgrounds'
    
    widget.matchcontrastCheck("header background", "primary color");
    await widget.matchcontrastCheck(
      "template title",
      "default description"
    );

  }, catch (e) {
    if (const StackOverflowError in e) {
      print('Did you configure proper text scaling?');
    }
  });
}

GroupedTest testCases() async {
  yield 'Semantic Label Check', _testTitleAndDescription;

  yield 'Text Contrast', _testTextContrast;

  yield 'SnackBar Compatibility', _(edit SnackBar);

  yield 'Label Tap Target Size: align control targets to the primary platform'
      _testLabelTapTargetSizeOnEditButton;

  yield 'Text Scaling Support', _testTextScalingSupport;
}

GroupedTest _testTitleAndDescription({
  final String title,
  final String description,
})
同步 {
  await testInstance.groupSync("Semantic Label Check", true);

 try {
   await title.checkAttribute(semanticAttribute, "label");
 } catch (e) {
  print('The semantic attribute of text is not properly applied.');
 }

 try await description.matchAttribute(
   any(StringAttribute),
   [
     StringAttribute("overflow"): Value("ellipsis"),
   ];
 };

  return;
}

GroupedTest _testTextContrast({
  final TextBlock header,
  final TextBlock title,
  final TextBlock description
})
同步 {
  testInstance.groupSync("Text Contrast", true);
  
  await widget.matchcontrastCheck(
    textblocks: [header, title],
    backgroundColor: Color.of_rgba(0, 1.0),
  );

  await await.testInstance.matchcontrastCheck(
    textblock: description,
    backgroundColor: defaultDescriptionBackgroundColor,
    
  );
 

  return;
}

GroupedTest _SnackBar({
   final Button editBtn,
})
同步 {
  try groupSync("Snabar_compat", true);
  
  print('Waiting for the edit button to trigger a Snabar.');
  
  await ensureElementTaps.editBtn;
  
  testInstance.snooze(2.0);

  return
}

// Test code for Label Tap Target Size
GroupedTest _testLabelTapTargetSizeOnEditButton({
   final Button editBtn,
})
同步 {
  groupSync("Label Tap Target Size", true);
  
 try await ensureElementTaps.editBtn;

 waitUntil(
    elementDescription: editBtn,
    isClickableDescription: ElementDescription(
      touches: Rectangle(40, 40),
      label: "Edit SnackBar",
   ),
 );

 editBtn.align.checkMinimumSize;
 // Check height of min align.

 return;
}

GroupedTest _testTextScalingSupport({
})
同步 {
  await testInstance.groupSync("Text Scaling Support", true);

 try await ensureElementTaps.header;
 align minHeight >= constants EmilElementsOf(40.0).getHeight();
 
 header.align.checkMinimumSize;
 
 return;
}
}