import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';

@RoutePage(name: 'SettingsScreenRoute')
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inner Settings'),
        leading: const AutoLeadingButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Text('App Bloc Counter: ${state.counter}');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AppBloc>().add(ChangeAppState());
              },
              child: const Text('Change App State (Trigger Reevaluate)'),
            ),
          ],
        ),
      ),
    );
  }
}
