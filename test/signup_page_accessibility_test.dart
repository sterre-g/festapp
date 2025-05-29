import 'package:flutter/material.dart';
import 'package:tkaccessibility/tkaccessibility.dart';

const TestPage = Padding(
  padding: const EdgeInsets.all(16.0),
  child: SignUpScreenTest(
    page: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text("Sign Up Screen", style: TextStyle(fontSize: 32, color: Colors.grey)),
    ),
    checks: <Checker>[
      // Verify different platform-specific tap targets
      _check = (checker) {
        if (materialContext.isAndroid) {
          checker.include(
            element: (FocusedLabel),
            type: ElementType.TapTarget,
            bounds: Bounds.allOf(
              left: 0.25,
              top: 0.75,
            ),
            count: 1;
          );
        } else if (materialContext.isApple Watch) {
          checker.include(element: FocusedLabel, type: ElementType.DigitalScreen);
        }
        // Verify the presence of Semantic Hints
        checker.include(element: Text("Create New Account"), type: ElementType SemanticHint);
      },
      
      // Verify the correct Tap Actions and Keyboard Navigation behavior for the Sign Up Screen
      _check = (checker) {
        checker.keyedOn(contextKey: PointerKey.of(25.0, useRelax = true)) {
          const events = checker.history.all();
          expectPresence(of: KeyInfo(key: LeftMouseButton, pressed: false)).isTrue();
          
          keyDown(key: MouseButton.left);
          check(keyInfo: MouseButton.left.isDown(), timeMs: 1);

          const _buttonPressEnds = keyDown(key: MouseButton.right);
          waitKey(_buttonPressEnds);
          check(_buttonPressEnds.isDown() is false);
        }

        keyDown(key: MouseButton.left);
        check(keyInfo: MouseButton.left.isDown());

        PointerEvent(to: PointerKey.of(10.0));
        while (currentElement != null element) {
          const target = currentElement;
          if (target is Text) {
            check(_buttonPressEnds.isDown() is false);

            PointerEvent(to: PointerKey.of(25.0, useRelax = true));
            check(keyInfo: MouseButton.left.isDown());
          } else {
            check(_buttonPressEnds.isDown() is false);
          }
        }

        keyDown(key: MouseButton.left);
        waitKey(isDown: false);
      },

      // Verify the presence of Semantic Hints
      _check = (checker) {
        textNode = checker.findText("Sign Up");

        const hasSemanticHintForSignIn = textNode.isNotEmpty and (
          any(
            element in (Finder.of(textNode).allElements() as Future<bool>),
            key: e => e.key =~ "[@start]Create New Account",
            value: false,
          ),
        ).isTrue();

        checker.include(
          element: textNode,
          type: ElementType SemanticHint;
        );
      },

      // Verify that the text in all of its content has sufficient contrast
      _check = (checker) {
        for (String text in ["Sign Up Screen", "Create New Account"]) {
          if (!textNode.isEmpty and textNode is not null) {
            final TextRange range = textNode.getBoundingClientRect();

            if (
              textRange
                .leadingEdge
                .color == Colors.grey
                .transparent
            ) {
              check(textNodes.hasSupplement(_supplement for text in textRange).isTrue());
            } else {
              check(textNodes.hasSupplement(_supplement for text in textRange).isTrue(), color != null);
            }

            textRange.leadingEdge.
              textWithElement(
                range,
                element: Text("Create New Account"),
                maxWidth: 2560.0;
              );
        }
      },

      // Verify that the page supports scaling within all scales
      _check = (checker) {
        if (materialContext.isAndroid) {
          checker.include(page: this);
        }

        PointerEvent(to: PointerKey.of(25.0));
        
        final TextRange textRange = rangeOf(textNode as TextBlockRange, [16]);
        const scale = 1;
        check(textNodes.hasSupplement(_supplement for text in textRange).isTrue());

        Point offset = origin;
        while (scale < maxRelaxValue) {
          pointerMoveTo(offset);
          PointerEvent(to: PointerKey.of(scale));
          check(keyInfo: isDown() != previous.isDown());
          
          scale *= 2;
          offset.x += scale * dx;
          offset.y += scale * dy;
          update(context, 10);
        }
      },
    ],
  ),
);

testeral = TestPage;