import 'package:blog_explorer/controller/routes/routes_name_controller.dart';
import 'package:flutter/material.dart';

import '../../view/screen/blog_screen.dart';
import '../../view/screen/detail_screen.dart';
import '../../view/screen/favorite_screen.dart';

class RoutesController {
  static Route<dynamic> onGenratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNamesController.blogScreen:
        return MaterialPageRoute(
          builder: (_) => const BlogScreen(),
        );
      case RoutesNamesController.detailScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailScreen(),
        );

      case RoutesNamesController.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoriteScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
