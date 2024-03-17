import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/fetch_blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBlogsCubit extends Cubit<BlogState> {
  final FetchBlogInteractor interactor;
  FetchBlogsCubit({
    required this.interactor,
  }) : super(BlogInitial());

  void fetchBlogs() async {
    emit(BlogLoading());
    final res = await interactor(NoParams());
    res.fold(
      (l) => emit(
        BlogFailure(message: l.message),
      ),
      (res) => emit(
        BlogSuccess(blog: res),
      ),
    );
  }
}
