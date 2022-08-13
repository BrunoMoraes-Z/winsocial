import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winsocial/controller/login_controller.dart';
import 'package:winsocial/screens/change_password/change_password.dart';
import 'package:winsocial/screens/exame/exame_screen.dart';
import 'package:winsocial/screens/find_farmacy/find_farmacy.dart';
import 'package:winsocial/screens/find_medicine/find_medicine_screen.dart';
import 'package:winsocial/screens/home/home_screen.dart';
import 'package:winsocial/screens/login/login_screen.dart';
import 'package:winsocial/screens/tele_saude/tele_saude_screen.dart';

final loginController = LoginController();
const _defaultRoute = '/';

final _routes = [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
      );
    },
  ),
  GoRoute(
    path: '/login',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const LoginScreen(),
      );
    },
  ),
  GoRoute(
    path: '/telemedicina',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const TeleSaudeScreen(),
      );
    },
  ),
  GoRoute(
    path: '/encontrar-medicamento',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const FindMedicineScreen(),
      );
    },
  ),
  GoRoute(
    path: '/consulta-exame',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const ExameScreen(),
      );
    },
  ),
  GoRoute(
    path: '/encontrar-farmacia',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const FindFarmacy(),
      );
    },
  ),
  GoRoute(
    path: '/alterar-senha',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        child: const ChangePasswordScreen(),
      );
    },
  )
];

final routes = GoRouter(
  initialLocation: '/login',
  refreshListenable: loginController,
  redirect: (state) {
    if (!_routes.any((route) => route.path == state.location)) {
      return _defaultRoute;
    }
    final isAuthenticated = loginController.isAuthenticated;
    final isLoginRoute = state.subloc == '/login';

    if (!isAuthenticated) return isLoginRoute ? null : '/login';
    if (isLoginRoute) return _defaultRoute;

    return null;
  },
  routes: _routes,
);

void routeNavigate(BuildContext context, String path) {
  if (_routes.any((route) => route.path == path)) {
    context.push(path);
  } else {
    if (path.startsWith('https') || path.startsWith('http')) {
      _launchUrl(path);
    }
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
