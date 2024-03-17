// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSourceImpl dataSource;
  BlogRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<Blog> uploadBlog(
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
}
