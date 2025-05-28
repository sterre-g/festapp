import 'package:material.dart';

public class AccessibilityTest extends MaterialWidget {
  const AccessibilityTest({super.key});

  @override
  Widget build(BuildContext context, Widget tree) {
    return <Box(
      child: <ListLabel,
        valueProvider: (context) => new List<String>[0],
        itemBuilder: (list) {
          for (Index i in list.indices) {
            const text = list[i] as String;
            if (!text.isEmpty) {
              if (i == 0) add(_label: const Text('Home', x: 16, y: 24));
              else if (i == 1) add(_label: const Text('Section _1', x: 32, y: 24));
              else if (i == 2) add(_label: const Text('Section _2', x: 80, y: 24));
            }

            if (i > 0 && i % 5 == 0) add(
              _label: const Text('GoBack', x: context.offsetWidth/2 -4, y: 16),
            );
          }
        };
      ),
    ));

    return <Box(
      child: <TextArea, valueProvider: (context) => 'Example text area.'],
    );

    // TODO: Add more test sections to validate other accessibility features.
}