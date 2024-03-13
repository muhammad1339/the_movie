import 'package:flutter/material.dart';
import 'package:the_movie/features/discover_movie/presentation/view/discover_movie_page.dart';

import '../../features/splash/view/splash_page.dart';
import 'route_transitions.dart';

class KAppRoutes {
  static const String splash = '/';
  static const String discoverMovie = '/discoverMovie';
  static const String movieDetail = '/movieDetail';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return createRoute(const SplashPage(), settings: routeSettings);
      case discoverMovie:
        return createRoute(const DiscoverMoviePage(), settings: routeSettings);


    }
    return null;
  }
}
