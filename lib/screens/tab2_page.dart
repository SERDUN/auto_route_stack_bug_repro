import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../router/app_router.dart';

@RoutePage(name: 'Tab2ScreenPageRoute')
class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
        onPressed: () {
          AutoRouter.of(context).push(const SettingsRoute());
        },
        child: const Text(
          'Content of Tab 2',
        ),
      )),
    );
  }
}
