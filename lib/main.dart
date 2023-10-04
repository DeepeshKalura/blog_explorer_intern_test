import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/api/blogs_api_controller.dart';
import 'controller/events/blog_screen_events_eontroller.dart';
import 'controller/routes/routes_controller.dart';
import 'controller/routes/routes_name_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => APIController(),
        ),
        ChangeNotifierProvider(
          create: (_) => BlogScreenEventsController(),
        ),
      ],
      child: MaterialApp(
        title: 'Blog Explorer',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RoutesController.onGenratingRoute,
        initialRoute: RoutesNamesController.blogScreen,
      ),
    );
  }
}
