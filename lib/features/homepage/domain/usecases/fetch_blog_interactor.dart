import 'package:clean_arch_application/core/error/exception.dart';
import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/homepage/domain/entities/blog.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';
import 'package:dartz/dartz.dart';

class FetchBlogInteractor implements AsyncUseCase<List<Blog>, NoParams> {
  final BlogRepository repository;
  FetchBlogInteractor({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams param) async {
    try {
      final res = await repository.fetchBlogs();
      return Right(res);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
