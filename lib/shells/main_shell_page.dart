import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
