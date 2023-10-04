import 'package:blog_explorer/model/shared_preference/app_preference.dart';
import 'package:flutter/material.dart';

import '../widget/custom_appbar_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteBlogs = AppPreference.getFavoriteBlogs();
    return Scaffold(
      appBar: CustomAppBarWidget(
        path: 'assets/icons/arrow.svg',
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: ListView.builder(
        itemCount: favoriteBlogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Text(
              favoriteBlogs[index].blogId ?? "No Favorite Blogs",
            ),
          );
        },
      ),
    );
  }
}
