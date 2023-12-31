import 'package:flutter/material.dart';

class BlogScreenEventsController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  bool isLiked = false;

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }
}
