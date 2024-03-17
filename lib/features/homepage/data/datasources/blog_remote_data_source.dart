// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:clean_arch_application/features/homepage/data/models/blog_model.dart';

abstract interface class BlogRemoteDatatSource {
  Future<BlogModel> uploadBlog({required BlogModel model});
  Future<BlogModel> retriveBlog({required BlogModel model});
  Future<String> uploadBlogImage(
      {required File file, required BlogModel model});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDatatSource {
  final SupabaseClient client;
  BlogRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<BlogModel> retriveBlog({required BlogModel model}) async {}

  @override
  Future<BlogModel> uploadBlog({required BlogModel model}) async {
    final res = await client.from("blogs").insert(model.toJson());
    return BlogModel.fromJson(res.first);
  }

  @override
  Future<String> uploadBlogImage(
      {required File file, required BlogModel model}) async {
    final _ = await client.storage.from("blog_images").upload(model.id, file);
    final res = client.storage.from("blog_images").getPublicUrl(model.id);
    return res;
  }
}
