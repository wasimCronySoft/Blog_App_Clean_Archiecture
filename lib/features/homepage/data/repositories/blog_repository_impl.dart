import 'dart:io';

import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDatatSource dataSource;
  BlogRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<void> uploadBlog(
      {required BlogParams params, required File file}) async {
    final imageString =
        await dataSource.uploadBlogImage(file: file, params: params);
    final res = await dataSource.uploadBlog(
      params: params.copyWith(
        imageUrl: imageString,
      ),
    );
    return res;
  }

  @override
  Future<List<Blog>> fetchBlogs() async {
    final res = await dataSource.fetchBlog();
    return res;
  }
}
