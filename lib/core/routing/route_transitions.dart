import 'package:flutter/material.dart';


Route createRoute(Widget page, {RouteSettings? settings}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => page,
  );
}
