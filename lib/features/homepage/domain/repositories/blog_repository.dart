import 'dart:io';

import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';

abstract interface class BlogRepository {
  Future<Blog> uploadBlog({required BlogParams params, required File file});
}
