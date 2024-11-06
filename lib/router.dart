import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshop/analytics/logger.dart';
import 'package:quickshop/data/user.dart';
import 'package:quickshop/pages/home/home_page.dart';
import 'package:quickshop/pages/login/login_email_page.dart';
import 'package:quickshop/pages/login/login_landing_page.dart';
import 'package:quickshop/src/settings/settings_controller.dart';
import 'package:quickshop/src/settings/settings_service.dart';
import 'package:quickshop/src/settings/settings_view.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'router.g.dart';

final settingsController = SettingsController(SettingsService());

@riverpod
GoRouter router(Ref ref) {
  final loggedInNotifier = ValueNotifier<bool>(false);
  ref.listen<bool>(
    loggedInProvider,
    (_, loggedIn) => loggedInNotifier.value = loggedIn,
    fireImmediately: true,
  );
  final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginLandingPage(),
        routes: [
          GoRoute(
            path: _RouteSegments.email,
            builder: (context, state) => const LoginEmailPage(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => SettingsView(controller: settingsController),
      ),
    ],
    refreshListenable: loggedInNotifier,
    redirect: (context, state) {
      // Redirect unauthenticated users to login
      if (!loggedInNotifier.value && !state.uri.path.startsWith(Routes.login)) {
        ref.read(loggerProvider).log('Redirecting unauthenticated user to login');
        return Routes.login;
      }
      return null;
    },
    observers: [
      SentryNavigatorObserver(),
    ],
  );
  ref.onDispose(loggedInNotifier.dispose);
  ref.onDispose(router.dispose);
  return router;
}

class _RouteSegments {
  static const login = 'login';
  static const email = 'email';
  static const settings = 'settings';
  static const lists = 'lists';
}

class Routes {
  static const home = '/';
  static const login = '/${_RouteSegments.login}';
  static const loginEmail = '${Routes.login}/${_RouteSegments.email}';
  static const settings = '/${_RouteSegments.settings}';
  static const lists = '/${_RouteSegments.lists}';
}
