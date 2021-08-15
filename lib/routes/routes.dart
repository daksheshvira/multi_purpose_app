import 'package:flutter/material.dart';
import 'package:multi_purpose_app/data/models/album.dart';
import 'package:multi_purpose_app/ui/album_detail/album_detail_screen.dart';
import 'package:multi_purpose_app/ui/create_post/create_post.dart';
import 'package:multi_purpose_app/ui/login/login_screen.dart';
import 'package:multi_purpose_app/ui/navbar/navbar.dart';
import 'package:multi_purpose_app/ui/splash_screen.dart';
import 'package:multi_purpose_app/ui/view_comments/ViewComments.dart';

part 'route_arguments.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const navbar = '/navbar';
  static const createPost = '/create_post';
  static const albumDetail = '/album_detail';
  static const viewComments = '/view_comments';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );

      case Routes.navbar:
        return MaterialPageRoute(
          builder: (_) => Navbar(),
          settings: settings,
        );

      case Routes.createPost:
        return MaterialPageRoute(
          builder: (_) => CreatePost(),
          settings: settings,
        );
      case Routes.albumDetail:
        if (args is Album) {
          return MaterialPageRoute(
            builder: (_) => AlbumDetailScreen(
              album: args,
            ),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Container(),
            settings: settings,
          );
        }
      case Routes.viewComments:
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => ViewComments(
              postId: args,
            ),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Container(),
            settings: settings,
          );
        }

      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
    }
  }
}
