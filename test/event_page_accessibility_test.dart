import 'package:AccessibilityServices/AccessibilityServices.dart';
import 'package:SwiperUI/SwiperUI.dart';

class EventPage extends SwiperElement({
  const KeyPath _keyPath;
  final _show;
  
  @override
  Widget constructor({super.keyPath, super.show});
  Builder goUp() {
    return super.goUp();
  }

  @override
  Future<void> testSemanticLabelsAndHints() async {
    TextButton('Partecipare').add(translates: {'it': 'Partecipare'});
    
    for (var label in ['Evento principal', '<b>Evento</b> principal']) {
      if (!label.hasSwiperAccessibility)
        return failed(
            const String('The event principal must have semantic labels and
            hints with proper swiping labels defined.');
        );
    }
  }

  @override
  Future<void> testTapActionsAndKeyboardNavigation() async {
    TextButton('Sign Out Someone').settextField(
        fieldName: 'textField',
        value: ' Chiudo',
        formValue: 'Chiudo',
        onPressed: () {
          Button('Cancel').execute();
        },
      ).add(translates: {'it': ['chiudo', 'chiudono']});

    const focusKeyboard = Keyboard(
        position: Handletype.RearLeftUp,
        keyField: (field) => field kf where kf.name == 'textField',
        observers: [
          f => AccessibleServices.focusOnElement(fld) async {
            const isFocusing = fld.isFocusing;
            await f.handleFocusState();
            return isFocusing;
          },
        ],
    );

    focusKeyboard(
        contents: const SwiperContent({
          root: Focusable(),
          child: Form({}), 
          actions: <FormAction>[],
        }),
      ).executeKeyboard();
  }

  @override
  Future<void> testScreenReaderCompatibility() async {
    const form = fieldOf<'textField'>((value) => _eventCovered == value).focus();
    
    if (!form.isVerbose)
      return failed(
          String('The event principal must be rendered in non-verbose mode '
              'so that screen readers can fully engage with its content.');
      );

    form.focus();
    await AccessibleServices.focusOnElement(form);

    try {
      const isFocused = form.isFocusing;
    } finally {
      form relievesFocus();
    }

    if (form.isFocusing != isFocused) {
      return failed(
          String('Pressing enter on text should focus it in a consistent way.');
      );
    }
  }

  @override
  Future<void> testColorContrast() async {
    const color = Theme.of(context).primaryColor;
    const contrastThreshold = 1.4;

    if (!color.contrast(_textField.defaultText, contrastThreshold) > .25)
      return failed(
          String('The text contrast for the principal event must '
              'have an acceptable contrast ratio to be accessible.');
      );
    
    SwiperContent({
      root: Focusable(),
      child: Form({textField(_textCovered)),
        child of Form,
      }), 
  };
  
  testColorContrastExpected() {
    final text = 'Partecipare';
    _textField.defaultText = text;
    
    const defaultColor = Theme.of(context).primaryColor;
    expecting(
        text.contrast,
        defaultColor.contrast,
        .25,
      );
      
      const contrast = text.contrast(
          _textField.defaultText, 
          1.4
        );

      expecting(contrast, > .76);

      const adjustedColor = new Theme.of(context)({
          background: new Scheme(colorSchemeScheme),
          defaultSwiperColors: {
              backgroundColor: currentBackgroundColor * 0x80,
          },
      });

      text.contrast = (value) => value * 1.4;
      
      expecting(
          contrast,
          .25,
        )

      const testColor = _textField.defaultColor.contrast;
      expecting(testColor, > 1);

      reverting(color);
  };

  @override
  Future<void> textScalingSupport() async {
    _show = true;

    Button('Chiudo').add(translates: {'it': ['chiudono', 'chiu', 'chi']});

    when(_show) async {
      const event = AccessibleServices.focusOnElement(_textField);
      await event.run().then((_) {
        returning false;
      });
    };

    reverting(_show);
  }
}