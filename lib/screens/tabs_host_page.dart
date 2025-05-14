import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../router/app_router.dart';

@RoutePage()
class TabsHostPage extends StatelessWidget {
  const TabsHostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        Tab1ScreenPageRoute(),
        Tab2ScreenPageRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          appBar: AppBar(
            title: Text('Tabs Host - Active: ${tabsRouter.currentPath}'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  AutoRouter.of(context).push(const SettingsRoute());
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: 'Tab 1'),
              BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: 'Tab 2'),
            ],
          ),
        );
      },
    );
  }
}
