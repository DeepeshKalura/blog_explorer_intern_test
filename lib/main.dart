import 'package:blog_explorer/model/shared_preference/app_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/api/blogs_api_controller.dart';
import 'controller/events/blog_screen_events_eontroller.dart';
import 'controller/events/connectiviy_controller.dart';
import 'controller/routes/routes_controller.dart';
import 'controller/routes/routes_name_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppPreference.init();
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
        ChangeNotifierProvider(
          create: (_) => ConnectivityController(),
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
