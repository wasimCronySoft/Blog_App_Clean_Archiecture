import 'package:dartz/dartz.dart';

import 'package:clean_arch_application/core/error/exception.dart';
import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/auth/data/models/user_model.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';

class UserInteractor implements AsyncUseCase<UserModel?, void> {
  final AuthRepository repository;
  UserInteractor({
    required this.repository,
  });
  @override
  Future<Either<Failure, UserModel?>> call(void param) async {
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
