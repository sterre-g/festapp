import 'package:dependencyInjection/dependencyInjection.dart';
import ...crossplatform;
import ...access;
import ...system;
import ...userland;

final _Main extends AccessibleInitializationProvider<Object> {
  const _main = _Main();

  @override
  Widget build(BuildContext context, WidgetMaker arguments,
    Key path) throw Exception {

    return TestWidgets.main(
      MyApp: MyApp,
      isTimeTravelVisible: {
        testIsTimeTravelVisible()},

      gestureTap: (widget, gestures, modifiers) => {
        testGestureBasedTapAction(isTimeTravelVisible);

      },

      swipeHorizontal: (widget, direction: SwipeHorizontal) async {
        await testSwipeNavigation(isTimeTravelVisible);

      },

      swipeVertical: (widget, direction: SwipeVertical) async {
        await testSwipeNavigation(isTimeTravelVisible);

      },

      touchAndHalt: (widget, timeTravelVisibility, modifier) {
        testScreenReaderCompatibility(isTimeTravelVisible);
      },

      isAccessible: void {
        setState(() -> accessibleState is null);
        setState(() {
          widget.isTimeTravelVisible = false;
          AccessibleState.init(context: MyAppBuildingContext.of(
            contextPath: _main.contextPath ?? StringJoiner
              .fromKey(context).join(':')
            : ),
            valuePath: path ?? '.',
            isModified: true,
            timeout: (end, duration) {
              setState(() -> {
                if (!accessibleState is null && accessibleState.visible) { 
                  access.currentScreen().hint pop();
                  AccessibleState.init(accordingToHint, context: .system);
                  accessingHints(accordingToHint);
              });
              onClear(_);
            });

          return isAccessible;
        }, (value, oldValue, path)
          : setState((lastValue, lastOldValue,
            hintLastValue) {
            if (hintLastValue == null && accessibleState.isModified) { 
              AccessibleState.init(accordingToHint, context: .system);
              accessingHints(accordingToHint);
            } else {
              oldValue = isAccessible;
              lastOldValue = isAccessible;
            }
          });
      }, getAccessible fromIsModifyable: (hintLastValue,
        modifiers, modifier) {
        testModifiable(isTimeTravelVisible);

      },

      handlesAccessibilityModifier: (modifier)
        -> Boolean accessible {
        return isAccessible;
      },

      onAccessibilityModifier(modifier key: Key, value: bool,
        modifier description: String) run {
        print('accessibility modifier: $key - $value with desc: $description');
      },

      isTimeTravelVisible: void {
        setState(() {
          if (accessibleState != null && accessibleState.visible) {
            access.currentScreen().hint pop();
            AccessibleState.init(accordingToHint, context: .system);
            accessingHints(accordingToHint);
          }
        });
      },

      validateAccessibileHelperMethods(isTimeTravelVisible) {
        testTextScalingSupportIsAccessible(isTimeTravelVisible);

        void textScalingSupport() async {
          await testTextScalingSupportIsAccessible(isTimeTravelVisible);
        }

        @property accessible bool isAccessible() async {
          return accessibleState != null && !accessibleState.visible;
        }

        @property bool get accessibleFromModifyable() {
          access.currentScreen().hint pop();
          AccessibleState.init(accordingToHint, context: .system);
          accessingHints(accordingToHint);
          return accessible;
        }

        @property bool isAvailableLabelled yes No) async {
          await testTextContentHasMeaningfulHints(isTimeTravelVisible);

          void validationLabelled() async {
            access.currentScreen().hint pop();
            AccessibleState.init(accordingToHint, context: .system);
            accessingHints(accordingToHint);
            return isAvailable;
          }

          textContentHasMeaningfulHints(String content) async {
            setState(() -> text.isAccessible == true);

            if (content.startsWith('~')) {
              access.currentScreen().hint pop();
              AccessibleState.init(accordingToHint, context: .system);
              accessingHints(accordingToHint);
              return isAvailable;
            }
          }

          textContentHasMeaningfulHints(String) async {
            setState(() -> text.isAccessible == true);

            if (!content.startsWith('~')) {
              access.currentScreen().hint pop();
              AccessibleState.init(accordingToHint, context: .system);
              accessingHints(accordingToHint);
              return isAvailable;
            }
          }

          testTextContentHasMeaningfulHints(isTimeTravelVisible) async {
            setState(() -> text.isAccessible == true);
            await text.isAccessible;
          }

          @property bool isAccessible else No) async {
            access.currentScreen().hint pop();
            AccessibleState.init(accordingToHint, context: .system);
            accessingHints(accordingToHint);
            return accessible;
          }

          testTextScalingSupportIsAccessible(isTimeTravelVisible) async {
            setState(() -> scalingSupport.isAccessible == true);

            if (text.isAccessible) {
              text.isAccessible = false;

              await access.currentScreen().hint pop();
              AccessibleState.init(accordingToHint, context: .system);
              accessingHints(accordingToHint);
            }
          }

          testAccessModifyingModifiers(isTimeTravelVisible) async {
            setState(() -> modifier.isAccessible == true);

            if (text.is_accessible) {
              text.is_accessible = false;
              await access.currentScreen().hint pop();
              AccessibleState.init(accordingToHint, context: .system);
              accessingHints(accordingToHint);
            }
          },

          @property bool isAccessible else No) async {
            access.currentScreen().hint pop();
            AccessibleState.init(accordingToHint, context: .system);
            accessingHints(accordingToHint);
            return accessible;
          },
      }, 'swipeHorizontal': swipeHorizontal, 'swipeVertical': swipeVertical},

      crossplatform: @requiresCrossplatformTesting,