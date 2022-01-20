class ReviewModel {
  final String author;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

  ReviewModel({
    required this.author,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      author: json['author'],
      createdAt: DateTime.parse(json['created_at']),
      content: json['content'],
      updatedAt: DateTime.parse(json['updated_at']),
      url: json['url'],
    );
  }
}
