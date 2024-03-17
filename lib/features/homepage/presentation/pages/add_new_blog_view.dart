import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/widgets/add_new_blog.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewBlogView extends StatelessWidget {
  const AddNewBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadBlogCubit(
        interactor: DI.instance(),
      ),
      child: const AddNewBlogBody(),
    );
  }
}
