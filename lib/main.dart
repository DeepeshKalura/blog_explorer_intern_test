import 'package:flutter/material.dart';

import 'controller/routes/routes_controller.dart';
import 'controller/routes/routes_name_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Blog Explorer',
      onGenerateRoute: RoutesController.onGenratingRoute,
      initialRoute: RoutesNamesController.blogScreen,
    );
  }
}
