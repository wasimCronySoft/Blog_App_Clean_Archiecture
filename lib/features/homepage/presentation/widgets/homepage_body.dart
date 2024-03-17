import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/core/widgets/loading_indicator.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/fetch_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  void initState() {
    context.read<FetchBlogsCubit>().fetchBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.addBlog);
            },
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          )
        ],
      ),
      body: BlocListener<FetchBlogsCubit, BlogState>(
        listener: (context, state) {
          if (state is BlogLoading) {
            showLoadingIndicator(context);
          }
        },
        child: BlocBuilder<FetchBlogsCubit, BlogState>(
          builder: (context, state) {
            if (state is BlogSuccess) {
              if (state.blog!.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.blog!.length,
                  itemBuilder: (context, index) {
                    final blog = state.blog![index];
                    return BlogCard(blog: blog, color: Colors.grey.shade300);
                  },
                );
              }
              return const Center(
                child: Text("Add new Content"),
              );
            } else {
              return const Center(
                child: Text("Add new Content"),
              );
            }
          },
        ),
      ),
    );
  }
}
