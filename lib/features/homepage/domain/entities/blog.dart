class Blog {
  final String id;
  final String uid;
  final String title;
  final String content;
  final List<String> topics;
  final String imageUrl;
  final DateTime currentDateTime;
  Blog({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    required this.topics,
    required this.imageUrl,
    required this.currentDateTime,
  });
}
