import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/pages/root_app.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => RootApp());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(),
              ));
  }
}
