import 'dart:convert';

class Blog {
  String? id;
  String? imageUrl;
  String? title;

  Blog({this.id, this.imageUrl, this.title});

  factory Blog.fromMap(Map<String, dynamic> data) => Blog(
        id: data['id'] as String?,
        imageUrl: data['image_url'] as String?,
        title: data['title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image_url': imageUrl,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Blog].
  factory Blog.fromJson(String data) {
    return Blog.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Blog] to a JSON string.
  String toJson() => json.encode(toMap());
}
