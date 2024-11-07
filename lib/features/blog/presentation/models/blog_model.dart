class BlogModel {
  BlogModel({
    required this.content,
    required this.imageSrc,
    required this.createdAt,
    required this.readedTime,
  });
  final String content;
  final String imageSrc;
  final String createdAt;
  final String readedTime;
}
