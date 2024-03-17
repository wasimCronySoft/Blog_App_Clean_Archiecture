// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_application/features/homepage/domain/entities/blog_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/blog_interactor.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  final BlogInteractor interactor;
  BlogCubit(
    this.interactor,
  ) : super(BlogInitial());

  void uploadBlog(BlogParams params) async {
    emit(BlogLoading());
    final res = await interactor(params);
    res.fold(
      (l) => emit(BlogFailure(message: l.message)),
      (r) => emit(
        BlogSuccess(blog: r),
      ),
    );
  }
}
