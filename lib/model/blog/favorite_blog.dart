class FavoriteBlog {
  String? blogId;

  FavoriteBlog({this.blogId});

  Map<String, dynamic> toMap() => {
        'blogId': blogId,
      };

  factory FavoriteBlog.fromMap(Map<String, dynamic> data) => FavoriteBlog(
        blogId: data['blogId'] as String?,
      );
}
