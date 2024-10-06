import 'package:bhavesh_lingopanda/routes/route_name.dart';
import 'package:bhavesh_lingopanda/view/comment_view.dart';
import 'package:bhavesh_lingopanda/view/sign_in_view.dart';
import 'package:bhavesh_lingopanda/view/sign_up_view.dart';
import 'package:bhavesh_lingopanda/view/splash_view.dart';
import 'package:flutter/material.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case RouteName.splash:
          return const SplashView();
        case RouteName.signUp:
          return const SignUpView();
        case RouteName.signIn:
          return const SignInView();
        case RouteName.comments:
          return const CommentView();

        default:
          return const Scaffold(body: Center(child: Text('Route not found')));
      }
    });
  }
}
