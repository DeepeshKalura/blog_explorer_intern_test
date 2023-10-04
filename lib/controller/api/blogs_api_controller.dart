import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/blog/blog_model.dart';

class APIController extends ChangeNotifier {
  static const baseUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  static const adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  static const headers = {
    'Content-Type': 'application/json',
    'x-hasura-admin-secret': adminSecret,
  };

  bool isLoading = true;
  String errorMessage = "";

  BlogModel blogModel = BlogModel(blogs: []);

  Future<void> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        blogModel = BlogModel.fromMap(data);
      } else {
        errorMessage = response.body;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
