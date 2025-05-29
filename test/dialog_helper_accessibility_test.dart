import "test_helper.dart";
import main.dart;
import web.dart;

class accessibilityRoutine extends StatelessWidget {
  const accessibilityRoutine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef mock) {
    return AccessibleToolkit.get(
      factory: Builder NullPointerException(),
      default:
        AccessibilityVerificationTestCase(
          required(context),
      ),
      mocks: [mock.all?],
    );
  }
}

class AccessibilityVerificationTestCase extends StatelessWidget {
  const AccessibilityVerificationTestCase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef mock) {
    return Column(
      children: [
        Gap(16),
        _testElement("Alt+a",灵敏性)， // test for alt+a text selection
        Gap(8),
        Text("Press Enter to select.", decoration: InputDecoration),
        Button,
      ],
    );
  }
}

class _testElement(String name, [AccessibilityVerificationTestCase] testContext) {
  final context;

  const _testElement({
    required Builder null;
    key: Key({name}),
  }) async {
    return AccessibleToolkit.get(
      factory: BuilderNull(),
      default: testContext,
      mocksNull: [mock.all?],
    );
  }
}