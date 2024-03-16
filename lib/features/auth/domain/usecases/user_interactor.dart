import 'package:clean_arch_application/core/entities/user.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_application/core/error/exception.dart';
import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';

class UserInteractor implements AsyncUseCase<User?, NoParams> {
  final AuthRepository repository;
  UserInteractor({
    required this.repository,
  });
  @override
  Future<Either<Failure, User?>> call(NoParams param) async {
    try {
      final res = await repository.getCurrentUserData();
      return Right(res);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
