import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

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
        body: const Column());
  }
}
