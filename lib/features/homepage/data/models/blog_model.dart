import 'dart:convert';

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
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'title': title,
      'content': content,
      'topics': topics,
      'imageUrl': imageUrl,
      'currentDateTime': currentDateTime.millisecondsSinceEpoch,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      topics: map["topics"],
      imageUrl: map['imageUrl'] as String,
      currentDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['currentDateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
