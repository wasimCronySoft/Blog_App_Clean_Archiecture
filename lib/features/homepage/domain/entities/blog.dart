// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  final String id;
  final String uid;
  final String title;
  final String content;
  final List<String> topics;
  final String imageUrl;
  final DateTime currentDateTime;
  final String? name;
  Blog({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    required this.topics,
    required this.imageUrl,
    required this.currentDateTime,
    this.name,
  });
}
