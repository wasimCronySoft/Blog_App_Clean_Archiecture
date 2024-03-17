import 'dart:io';

import 'package:clean_arch_application/core/network/internet_checker.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_local_data_source.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDatatSource remoteDatatSource;
  final BlogLocalDataSource blogLocalDataSource;
  final ConnectionChecker connectionChecker;
  BlogRepositoryImpl({
    required this.remoteDatatSource,
    required this.blogLocalDataSource,
    required this.connectionChecker,
  });
  @override
  Future<void> uploadBlog(
      {required BlogParams params, required File file}) async {
    final imageString =
        await remoteDatatSource.uploadBlogImage(file: file, params: params);
    final res = await remoteDatatSource.uploadBlog(
      params: params.copyWith(
        imageUrl: imageString,
      ),
    );
    return res;
  }

  @override
  Future<List<Blog>> fetchBlogs() async {
    if (!(await connectionChecker.isConnected)) {
      final res = blogLocalDataSource.loadBlogs();
      return res;
    } else {
      final res = await remoteDatatSource.fetchBlog();
      return res;
    }
  }
}
