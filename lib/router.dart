import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: SignUpScreen.routeName,
    path: SignUpScreen.routeURL,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: LoginScreen.routerName,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: UsernameScreen.routerName,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const UsernameScreen(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
      );
    },
  ),
  GoRoute(
    path: EmailScreen.routerName,
    builder: (context, state) => const EmailScreen(),
  ),
]);
