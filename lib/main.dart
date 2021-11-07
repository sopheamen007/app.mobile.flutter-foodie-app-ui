// @dart=2.9

import 'package:flutter/material.dart';
import 'package:foodie_ui_kit/pages/login_page.dart';
import 'package:foodie_ui_kit/pages/root_app.dart';
import 'router.dart' as router;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    home: LoginPage(),
  ));
}
