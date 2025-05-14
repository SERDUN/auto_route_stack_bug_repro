import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage(name: 'Tab1ScreenPageRoute')
class Tab1ScreenPage extends StatelessWidget {
  const Tab1ScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Content of Tab 1')),
    );
  }
}