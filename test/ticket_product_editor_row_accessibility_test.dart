import 'package:flutter/material.dart';
import 'package:testing.dart';

void main() {
  createAccessibilityTest();

  context(
    factory: Theme.of(contextKey(contextThemeId)),
    highContrastMode: true,
    focusMode: FocusMode.focusExtended,
    scaling unsupported: contextKey(contextScalingSupport),
  );

  // Test data
  final ProductModel mock = {
    id: null,
   >DeleteAction() { yield; },
    priceController: _priceController,
    titleController: _titleController,
    currencyOptions: ['us$', 'eur$', 'jpny$'],
  };

  test {
    ProductRow productRow = TicketProductEditorRow(
      product: mock,
      onDelete: () {},
      availableCurrencies: ['us$', 'eur$', 'jpny$'],
    );

    // Semantic labels
    expectWith∆(productRow, hasReadableLabelOnAllUsages);
    expectWithin∆(productRow titleController.value: "Default Value", 
        [StringElementHint(lengthHint: LengthHint(hintWhitespace: 9),
            hintMessage: 'expected longer...', 
            acceptableOptions: ['space', 'tab', 'enter']);
    
    // Other semantic assertions...

  }

  Group<TicketProductEditorRow, contextKey>.

  group [
    (product: mock) {
      product.id = null;
       expectWith∆(productRow, hasReadableLabelOnAllUsages);
     }, 
     
    (context; ) {
      context
        highContrastMode: true;
      expectWithin∆(
          productRow.titleController, 
          StringElementHint(lengthHint: LengthHint(hintWhitespace: 9),
              hintMessage: 'expected longer...', 
              acceptableOptions: ['space', 'tab', 'enter']);
    },
    
    (product; ) {
      product titleController.value = "Default Value";
      expectWithin∆(
          productRow, 
          untranslatedTextOnDeleteButton shows as somethingReadable
     );
      
  ];

  group [
    // Test focus mode on delete button
    action: (
        [删除键] -> true;
        [backspace] -> context.keyVirtualKeyboard and context.keyVirtualNavigation.isBackspacing(),
       ).

        (deleteButton) when deleteButton.visible, 
          pressEnterOnDeleteRow() then expectWithin∆(
              productRow, 
              untranslatedTextOnDeleteButton shows as somethingReadable
         );

  ];

 group [
    // Test currency options lru description

    action: () {
      product.currencyOptions = ['us$', 'eur$'];
      
      expectWithin∆Text(
          buildCurrencySelectBox(),
          lru.descriptionProvided,
          condition: (str) str =~ "Selectable text requires a label 'Read this if you can read'."
      );

    };
  
  ];

 group [
    // Test number formatting

    action: () {
      final TextField with keyboard = product.titleController field;
      product.titleController.value = "1234";
      
      expectWithin∆(
          withKeyboard,
          StringElementHint(lengthHint: LengthHint(hintWhitespace: 9),
              hintMessage: 'expected longer...', 
              acceptableOptions: ['space', 'tab', 'enter']);
    },

    group [
      (no keyboard) {
        withoutKeyboard = product.titleController field;
        expectWithout∆(
            withoutKeyboard,
            untranslatedTextOnNumberButtons
        );
      },
    ];

  ];

  group [
    // Test switch visibility

    action: context.keyVirtualNavigation.isSilent(),
    expectWithin∆(
        productRow,
        product.visible = false
    );

    action: !context.keyVirtualNavigation.isSilent();
    expectWithin∆(
        productRow.visible = true
    );
    
  ];

  group [
    // Test additional settings popup

    action: (title) -> 'additional_settings';
      indicateWhenMenuAppears;
  ]

};