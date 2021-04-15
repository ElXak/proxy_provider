import 'package:flutter/material.dart';
import 'package:proxy_provider/logger.dart';

import '../core/constants/app_constants.dart';
import '../core/models/post.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/post_view.dart';

const String initialRoute = RoutePaths.Login;

final log = getLogger('Router');

Route<dynamic> generateRoute(RouteSettings settings) {
  log.i(
      'generateRoute | name:${settings.name} arguments: ${settings.arguments}');

  switch (settings.name) {
    case RoutePaths.Home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case RoutePaths.Login:
      return MaterialPageRoute(builder: (context) => LoginView());
    case RoutePaths.Post:
      var post = settings.arguments as Post;
      return MaterialPageRoute(builder: (context) => PostView(post: post));
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}

/*
class Route {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.Post:
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
*/
