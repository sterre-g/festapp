import 'dart:async';

import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fstapp/app_router.dart';
import 'package:fstapp/app_config.dart';
import 'package:fstapp/data/services/auth_service.dart';
import 'package:fstapp/data/services/offline_data_service.dart';
import 'package:fstapp/router_service.dart';
import 'package:fstapp/data/services/rights_service.dart';
import 'package:fstapp/data/services/synchro_service.dart';
import 'package:fstapp/pages/occasion/occasion_home_page.dart';
import 'package:fstapp/services/notification_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fstapp/services/time_helper.dart';
import 'package:fstapp/theme_config.dart';
import 'package:fstapp/widgets/time_travel_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  debugProfileBuildsEnabled = true;
  await initializeEverything();
  runApp(
    EasyLocalization(
        supportedLocales: AppConfig.availableLanguages().map((e) => e.locale).toList(),
        path: "assets/translations",
        fallbackLocale: AppConfig.availableLanguages().map((e) => e.locale).first,
        useOnlyLangCode: true,
        saveLocale: true,
        child: MyApp()),
  );
}

Future<void> initializeEverything() async {
  debugPrint('Initialization started');
  //GoRouter.optionURLReflectsImperativeAPIs = true;
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Widgets binding initialized');

  try {
    PWAInstall().setup();
    debugPrint('PWA setup completed');
  } catch (e) {
    debugPrint('PWA setup failed: $e');
  }

  try {
    await initializeDateFormatting();
    debugPrint('Date formatting initialized');
  } catch (e) {
    debugPrint('Date formatting initialization failed: $e');
  }

  try {
    await EasyLocalization.ensureInitialized();
    debugPrint('EasyLocalization initialized');
  } catch (e) {
    debugPrint('EasyLocalization initialization failed: $e');
  }

  try {
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.anonKey,
    ).timeout(const Duration(seconds: 2));
    debugPrint('Supabase initialized');
    if (!AuthService.isLoggedIn()) {
      await AuthService.refreshSession().timeout(const Duration(seconds: 2));
      debugPrint('Session refreshed');
    }
  } catch (e) {
    debugPrint('Supabase initialization failed: $e');
  }

  try {
    var settings = await OfflineDataService.getGlobalSettings();
    if (settings != null) {
      SynchroService.globalSettingsModel = settings;
      debugPrint('Global settings loaded');
    }
  } catch (e) {
    debugPrint('Offline data helper initialization failed: $e');
  }

  try {
    await RightsService.updateOccasionData();
    debugPrint('Occasion loaded');
  } catch (e) {
    debugPrint('Occasion loading failed: $e');
    RightsService.useOfflineVersion = true;
  }

  debugPrint('Notification helper initializing');

  NotificationHelper.initialize().then((f) {
    debugPrint('Notification helper initialized');
  }, onError: (e) {
    debugPrint('Notification helper initialization failed: $e');
  });

  debugPrint('Initialization completed');
}

class MyApp extends StatefulWidget {
  bool isTimeTravelVisible = false;

  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    TimeHelper.toggleTimeTravel = () {
      setState(() {
        widget.isTimeTravelVisible = !widget.isTimeTravelVisible;
      });
    };

    var baseTheme = ThemeConfig.baseTheme();
    return AdaptiveTheme(
      light: ThemeConfig.baseTheme(),
      dark: ThemeConfig.isDarkModeEnabled ? ThemeConfig.darkTheme(baseTheme) : baseTheme,
      initial: ThemeConfig.isDarkModeEnabled ? AdaptiveThemeMode.system : AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp.router(
        routerConfig: RouterService.router.config(navigatorObservers: () => [RoutingObserver()]),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return AccessibilityTools(
            child: Stack(
              children: [
                child!,
                Positioned(
                  left: _offset.dx,
                  top: _offset.dy,
                  child: GestureDetector(
                    onPanUpdate: (d) => setState(() => _offset += Offset(d.delta.dx, d.delta.dy)),
                    child: Visibility(
                      visible: widget.isTimeTravelVisible,
                      child: TimeTravelWidget(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        localizationsDelegates: [
          ...context.localizationDelegates,
          FormBuilderLocalizations.delegate,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: OccasionHomePage.HOME_PAGE,
        theme: theme,
        darkTheme: darkTheme,
      ).animate().fadeIn(
            duration: 300.ms,
          ),
    );
  }
}
