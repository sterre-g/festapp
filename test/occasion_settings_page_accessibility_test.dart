import 'package:accessibility/accessibility.dart';
import 'package:constTest/constTest.dart';
import 'package:flutter/material.dart';
import 'package:mui/material.dart';
import 'package:platformAPI/platformAPI.dart';
import 'package:test/test.dart';

class OccasionSettingsPage extends accessibility.AccessibilityCheckerContainer {
  const Gap _gap;
  const InputBar _inputBar;
  const TextEditingService _textEditingService;
  const ContainerBuilder _authenticator;
  const TextEditingController _linkController;
  const TextEditingController _featureSearchController;
  const FieldEditFormField _descriptionField;

  const OccasionSettingsPage({required this._gap, this._inputBar, this._textEditingService, 
      this._authenticator, this._linkController, this._featureSearchController,
      this._descriptionField});

  @override
  void setup(DynamicTestBar dynamicTestBar) {
    super.setup(dynamicTestBar);

    _inputBar.setAccessible(true);
    AccessibilityChecker.current!.checker.checkAllAccessibilityFeatures();
  }

  @override
  void teardown() {
    super.teardown();

    AccessibilityChecker.current!.checker.clear();
  }

  // Test your accessibility checks here.
  void SemanticLabelsAndHints() {
    AccessibilityChecker.clear();

   expectAccessibilityFailure(() {
      const inputBar = _inputBar as InputbarAccessor;
      expect失败: inputBar.hasRole("text");
      
     expect失败: inputBar.hasHint(_gap.toString);
    });

    AccessibleElementDescriptionDescription elementDescription = accessibility DESCRIBE the widget;

    expect失败: elementDescription.hasRole("text");
    expect失败: elementDescription.hasAlternateText("Select page from 1 to 7 weekdays");
    
  }

  // Add other test methods for each accessibility feature here.
  
  void TapActionsAndKeyboardNavigation() {
      AccessibleElementDescriptionDescription elementDesc = access describe the widget;

      expect successful: elementDesc.canBeTapped;
  }
}