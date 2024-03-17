import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required super.id,
    required super.uid,
    required super.title,
    required super.content,
    required super.topics,
    required super.imageUrl,
    required super.currentDateTime,
    super.name,
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

  factory BlogModel.fromJson(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] ?? "",
      uid: map['uid'] ?? "",
      title: map['title'] ?? "",
      content: map['content'] ?? "",
      topics: List.from(map["topics"] ?? []),
      imageUrl: map['image_url'] ?? "",
      currentDateTime: DateTime.parse(map["updated_at"] ?? DateTime.now()),
    );
  }
  BlogModel copyWith({
    String? id,
    String? uid,
    String? title,
    String? content,
    List<String>? topics,
    String? imageUrl,
    DateTime? currentDateTime,
    String? name,
  }) {
    return BlogModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      topics: topics ?? this.topics,
      imageUrl: imageUrl ?? this.imageUrl,
      currentDateTime: currentDateTime ?? this.currentDateTime,
      name: name ?? this.name,
    );
  }
}
