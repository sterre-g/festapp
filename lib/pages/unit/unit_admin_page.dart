import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fstapp/router_service.dart';
import 'package:fstapp/data/models/unit_model.dart';
import 'package:fstapp/data/services/db_users.dart';
import 'package:fstapp/components/features/feature_constants.dart';
import 'package:fstapp/components/features/feature_service.dart';
import 'package:fstapp/pages/unit/unit_page.dart';
import 'package:fstapp/pages/unit/unit_users_screen.dart';
import 'package:fstapp/pages/unit/quotes_tab.dart';
import 'package:fstapp/services/responsive_service.dart';
import 'package:fstapp/theme_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'occasions_screen.dart';

@RoutePage()
class UnitAdminPage extends StatefulWidget {
  int? id;

  UnitAdminPage({@pathParam required this.id, super.key});

  @override
  _UnitAdminPageState createState() => _UnitAdminPageState();
}

class _UnitAdminPageState extends State<UnitAdminPage> {
  UnitModel? _currentUnit;
  Widget _currentScreen = Center(child: Text("Select an option from the menu"));
  String _currentMenu = "";

  void _setCurrentScreen(Widget screen, String menu) {
    setState(() {
      _currentScreen = screen;
      _currentMenu = menu;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.id == null && context.routeData.hasPendingChildren) {
      widget.id = context.routeData.pendingChildren[0].params.getInt("id");
    }
    _loadOrganization();
  }

  Future<void> _loadOrganization() async {
    _currentUnit = await DbUsers.getCurrentUnit(widget.id!);
    if (_currentUnit != null) {
      // Set the default screen to Occasions
      _setCurrentScreen(OccasionsScreen(unit: _currentUnit!), "Occasions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        onMenuItemSelected: _setCurrentScreen,
        unit: _currentUnit,
        currentMenu: _currentMenu,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (ResponsiveService.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(
                  onMenuItemSelected: _setCurrentScreen,
                  unit: _currentUnit,
                  currentMenu: _currentMenu,
                ),
              )
            else
              SizedBox(
                width: 50,
                child: SideMenu(
                  onMenuItemSelected: _setCurrentScreen,
                  unit: _currentUnit,
                  currentMenu: _currentMenu,
                ),
              ),
            Expanded(
              flex: 5,
              child: _currentScreen,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterService.navigate(context, "${UnitPage.ROUTE}/${widget.id}")
              .then((_) => _loadOrganization());
        },
        child: const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}

class SideMenu extends StatefulWidget {
  final Function(Widget, String) onMenuItemSelected;
  final UnitModel? unit;
  final String currentMenu;

  const SideMenu({super.key, required this.onMenuItemSelected, required this.unit, required this.currentMenu});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String _versionInfo = "";

  @override
  void initState() {
    super.initState();
    _loadVersionInfo();
  }

  Future<void> _loadVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _versionInfo = "${packageInfo.appName} ${packageInfo.version}+${packageInfo.buildNumber}";
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveService.isDesktop(context);

    return Drawer(
      child: Column(
        children: [
          if (isDesktop)
            DrawerHeader(
              padding: const EdgeInsets.all(12),
              child: Text(widget.unit?.title ?? ""),
            ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  icon: Icons.calendar_month,
                  label: "Events".tr(),
                  isSelected: widget.currentMenu == "Occasions",
                  onTap: () {
                    if (widget.unit != null) {
                      widget.onMenuItemSelected(
                        OccasionsScreen(unit: widget.unit!),
                        "Occasions",
                      );
                    }
                  },
                ),
                _buildMenuItem(
                  icon: Icons.people,
                  label: "Users".tr(),
                  isSelected: widget.currentMenu == "Users",
                  onTap: () {
                    if (widget.unit != null) {
                      widget.onMenuItemSelected(
                        UnitUsersScreen(unit: widget.unit!),
                        "Users",
                      );
                    }
                  },
                ),
                // Conditionally add the Quotes tab if the feature is enabled.
                if (widget.unit != null &&
                    FeatureService.isFeatureEnabled(FeatureConstants.quotes, features: widget.unit!.features))
                  _buildMenuItem(
                    icon: Icons.format_quote,
                    label: "Quotes".tr(),
                    isSelected: widget.currentMenu == "Quotes",
                    onTap: () {
                      widget.onMenuItemSelected(
                        QuotesTab(unitId: widget.unit!.id!),
                        "Quotes",
                      );
                    },
                  ),
              ],
            ),
          ),
          if (isDesktop)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _versionInfo,
                style: const TextStyle(fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 8.0, right: 4.0), // Maintain left padding, reduce right padding
      leading: Icon(icon, size: 24),
      title: ResponsiveService.isDesktop(context)
          ? Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Make text bold when selected
        ),
      )
          : null,
      selected: isSelected,
      selectedTileColor: ThemeConfig.grey380(context), // Highlight selected item
      onTap: onTap,
    );
  }
}
