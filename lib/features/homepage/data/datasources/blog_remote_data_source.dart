// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:clean_arch_application/features/homepage/data/models/blog_model.dart';

abstract interface class BlogRemoteDatatSource {
  Future<BlogModel> uploadBlog({required BlogParams params});
  // Future<BlogModel> retriveBlog({required BlogParams params});
  Future<String> uploadBlogImage(
      {required File file, required BlogParams params});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDatatSource {
  final SupabaseClient client;
  BlogRemoteDataSourceImpl({
    required this.client,
  });
  @override
  // Future<BlogModel> retriveBlog({required BlogParams params}) async {}

  @override
  Future<BlogModel> uploadBlog({required BlogParams params}) async {
    final res = await client.from("blogs").insert(params);
    return BlogModel.fromJson(res.first);
  }

  @override
  Future<String> uploadBlogImage(
      {required File file, required BlogParams params}) async {
    final _ = await client.storage.from("blog_images").upload(params.id, file);
    final res = client.storage.from("blog_images").getPublicUrl(params.id);
    return res;
  }
}
