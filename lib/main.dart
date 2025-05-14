import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_autorouter/bloc/app_bloc.dart';
import 'package:test_autorouter/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppBloc _appBloc = AppBloc();
  late final AppRouter _appRouter;

  MyApp({super.key}) {
    _appRouter = AppRouter(appBloc: _appBloc);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appBloc,
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          reevaluateListenable: ReevaluateListenable.stream(_appBloc.stream),
        ),
        title: 'MRE AutoRoute Bug',
      ),
    );
  }
}