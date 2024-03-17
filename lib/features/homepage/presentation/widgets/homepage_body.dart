import 'package:clean_arch_application/features/homepage/presentation/widgets/add_new_blog.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
      ),
      body: const AddNewBlogPage(),
    );
  }
}
