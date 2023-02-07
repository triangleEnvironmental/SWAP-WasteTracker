import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_tracker/app/constants/index.dart';
import 'package:waste_tracker/app/routes/app_pages.dart';
import 'package:waste_tracker/app/services/index.dart';
import 'package:waste_tracker/locales/index.dart';

class HomeLayout extends StatefulWidget {
  final Widget child;
  final String routeName;

  const HomeLayout({
    Key? key,
    required this.child,
    required this.routeName,
  }) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AuthService authService;

  int getActiveIndex(Map<String, NavigationDestination> destinationMaps) {
    if (destinationMaps.containsKey(widget.routeName)) {
      return destinationMaps.keys.toList().indexOf(widget.routeName);
    }
    return 0;
  }

  @override
  void initState() {
    authService = Get.find<AuthService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService.listenable,
      builder: (context, _, __) {
        final destinationMaps = <String, NavigationDestination>{
          Routes.routeHome: NavigationDestination(
            icon: const Icon(
              AppIcons.home,
            ),
            selectedIcon: const Icon(
              AppIcons.home,
              color: Colors.white,
            ),
            label: LocaleKeys.label_home,
            tooltip: LocaleKeys.label_home,
          ),
          Routes.routeReportList: NavigationDestination(
            icon: const Icon(
              AppIcons.report,
            ),
            selectedIcon: const Icon(
              AppIcons.report,
              color: Colors.white,
            ),
            label: LocaleKeys.label_reports,
            tooltip: LocaleKeys.label_reports,
          ),
          Routes.routeReportMap: NavigationDestination(
            icon: const Icon(
              AppIcons.map,
            ),
            selectedIcon: const Icon(
              AppIcons.map,
              color: Colors.white,
            ),
            label: LocaleKeys.label_map,
            tooltip: LocaleKeys.label_map,
          ),
          Routes.routeFaqList: NavigationDestination(
            icon: const Icon(
              AppIcons.faq,
            ),
            selectedIcon: const Icon(
              AppIcons.faq,
              color: Colors.white,
            ),
            label: LocaleKeys.label_tips,
            tooltip: LocaleKeys.label_tips,
          ),
          if (authService.isLoggedIn)
            Routes.routeReportHistory: NavigationDestination(
              icon: const Icon(
                AppIcons.history,
              ),
              selectedIcon: const Icon(
                AppIcons.history,
                color: Colors.white,
              ),
              label: LocaleKeys.label_history,
              tooltip: LocaleKeys.label_history,
            ),
        };

        return Scaffold(
          body: widget.child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: 0,
            onDestinationSelected: (index) {
              if (index > 0) {
                Get.toNamed(
                  destinationMaps.keys.toList()[index],
                );
              }
            },
            destinations: destinationMaps.values.toList(),
          ),
        );
      },
    );
  }
}
