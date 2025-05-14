import 'package:auto_route/auto_route.dart';

import '../bloc/app_bloc.dart';
import '../screens/screens.dart';
import '../shells/shells.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AppBloc appBloc;

  AppRouter({required this.appBloc});

  String get _initialTabPath => Tab1ScreenPageRoute.name;

  @override
  List<AutoRoute> get routes => [
        AutoRoute.guarded(
          page: AppShellRoute.page,
          onNavigation: onAppShellRouteGuardNavigation,
          path: '/',
          children: [
            AutoRoute.guarded(
              initial: true,
              page: MainShellRoute.page,
              path: 'main',
              children: [
                AutoRoute(
                  path: '',
                  page: TabsHostRoute.page,
                  children: [
                    RedirectRoute(path: '', redirectTo: _initialTabPath),
                    AutoRoute(path: 'tab1', page: Tab1ScreenPageRoute.page),
                    AutoRoute(path: 'tab2', page: Tab2ScreenPageRoute.page),
                  ],
                ),
                AutoRoute(
                  path: 'settings',
                  page: SettingsRoute.page,
                  children: [
                    AutoRoute(path: '', page: SettingsScreenRoute.page, initial: true),
                  ],
                ),
              ],
              onNavigation: (NavigationResolver resolver, StackRouter router) {
                resolver.next(true);
              },
            ),
          ],
        ),
      ];

  void onAppShellRouteGuardNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);

    // Since reevaluateListenable triggers reevaluation only on the root router,
    // explicit reevaluation on the app shell router is necessary to ensure
    // proper handling of login/logout functionality.
    if (resolver.isReevaluating) {
      final innerRouter = router.innerRouterOf<StackRouter>(AppShellRoute.name);
      innerRouter?.reevaluateGuards();
    }
  }
}
