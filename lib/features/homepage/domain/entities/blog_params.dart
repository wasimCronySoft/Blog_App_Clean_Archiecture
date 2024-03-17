// ignore_for_file: public_member_api_docs, sort_constructors_first
class BlogParams {
  final String id;
  final String uid;
  final String title;
  final String content;
  final List<String> topics;
  final String imageUrl;
  final DateTime currentDateTime;
  BlogParams({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    required this.topics,
    required this.imageUrl,
    required this.currentDateTime,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'title': title,
      'content': content,
      'topics': topics,
      'image_url': imageUrl,
      'updated_at': currentDateTime.toIso8601String(),
    };
  }

  BlogParams copyWith({
    String? id,
    String? uid,
    String? title,
    String? content,
    List<String>? topics,
    String? imageUrl,
    DateTime? currentDateTime,
  }) {
    return BlogParams(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      topics: topics ?? this.topics,
      imageUrl: imageUrl ?? this.imageUrl,
      currentDateTime: currentDateTime ?? this.currentDateTime,
    );
  }
}
