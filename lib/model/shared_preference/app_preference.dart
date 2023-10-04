import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../blog/favorite_blog.dart';

class AppPreference {
  static final AppPreference _instance = AppPreference._internal();

  factory AppPreference() {
    return _instance;
  }

  AppPreference._internal();

  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static clearSharedPreferences() async {
    _preferences.clear();
  }

  static reloadData() async {
    _preferences.reload();
  }

  static addSharedPreferences(dynamic value, String key) async {
    if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  static dynamic getValueShared(String key) {
    return _preferences.get(key);
  }

  static dynamic getValueSharedinList(String key) {
    return _preferences.getStringList(key);
  }

  static List<FavoriteBlog> getFavoriteBlogs() {
    final favoriteBlogsJson =
        _preferences.getStringList('favorite_blogs') ?? [];
    return favoriteBlogsJson
        .map((jsonString) => FavoriteBlog.fromMap(jsonDecode(jsonString)))
        .toList();
  }

  static void addFavoriteBlog(FavoriteBlog favoriteBlog) {
    final favoriteBlogs = getFavoriteBlogs();
    favoriteBlogs.add(favoriteBlog);
    final favoriteBlogsJson =
        favoriteBlogs.map((blog) => jsonEncode(blog.toMap())).toList();
    _preferences.setStringList('favorite_blogs', favoriteBlogsJson);
  }

  static void removeFavoriteBlog(String blogId) {
    final favoriteBlogs = getFavoriteBlogs();
    favoriteBlogs.removeWhere((blog) => blog.blogId == blogId);
    final favoriteBlogsJson =
        favoriteBlogs.map((blog) => jsonEncode(blog.toMap())).toList();
    _preferences.setStringList('favorite_blogs', favoriteBlogsJson);
  }
}
