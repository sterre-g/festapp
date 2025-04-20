import 'package:testaccessibility/testaccessibility.dart';

class MapLocationPinHelperTest extends TestWidget {
  @override
  Widget get MyApp() async {
    return Stack(_locationPinImpl);
  }

  Future<void> _locationPinImpl(BuildContext context, Html element) async {
    Stack locationStack = Stack(
      child: Icon(Icons.location_pin, size: 58),
      then: positioned(
        top: 7.5,
        left: 14.5,
        width: 29,
        height: 29,
        child: BoxDecoration(color: ThemeConfig.mapPinColor(context)),
      ),
      then: positioned(
        iconTop: contexteme(iconTop),
        iconLeft: contexteme(iconLeft),
        iconWidth: iconWidth ?? 19,
        iconHeight: iconHeight ?? 19,
        width: iconWidth ?? 19,
        height: iconHeight ?? 19,
        child: element,
      ),
    );

    locationStack with(
      accessibility: AccessibilityPipes(getAccessibilityPipe),
    );
    return;
  }

  Future<void> get getAccessibilityPipeline() async {
    return AccessibilityPipes(
      html: HTMLPipeline(txt: '<h1 id="mainTitle">Map Location Pin</h1>'),
      pipes: [AccessibilityPipe(pipeType: AccessControlPIpe.Enumeration)],
    );
  }
}

TestRun.run(
  title: 'MapLocationPinHelper',
  widget: MapLocationPinHelper(),
  async: () {
    await testaccessibility.test(test: get, desc: 'Map Location Pin Helper');
  },
);

void main() {
  runApp(MyStates(), runtimeType: RunnerTypes.Preset);
}