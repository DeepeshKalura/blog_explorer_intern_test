import 'dart:convert';

import 'blog.dart';

class BlogModel {
  List<Blog>? blogs;

  BlogModel({this.blogs});

  factory BlogModel.fromMap(Map<String, dynamic> data) => BlogModel(
        blogs: (data['blogs'] as List<dynamic>?)
            ?.map((e) => Blog.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'blogs': blogs?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BlogModel].
  factory BlogModel.fromJson(String data) {
    return BlogModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BlogModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
