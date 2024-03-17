import 'dart:io';

import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';

abstract interface class BlogRepository {
  Future<void> uploadBlog({required BlogParams params, required File file});
}
