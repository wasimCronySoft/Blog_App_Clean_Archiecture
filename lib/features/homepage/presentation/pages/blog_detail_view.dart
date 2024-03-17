import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/presentation/widgets/blog_detail_body.dart';
import 'package:flutter/cupertino.dart';

class BlogDetailView extends StatelessWidget {
  const BlogDetailView({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return BlogDetailBody(
      blog: blog,
    );
  }
}
