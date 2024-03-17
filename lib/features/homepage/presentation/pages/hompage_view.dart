import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/fetch_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/widgets/homepage_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadBlogCubit(
            interactor: DI.instance(),
          ),
        ),
        BlocProvider(
          create: (context) => FetchBlogsCubit(
            interactor: DI.instance(),
          ),
        ),
      ],
      child: const HomepageBody(),
    );
  }
}
