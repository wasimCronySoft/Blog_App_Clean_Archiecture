// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_application/core/error/exception.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/auth/domain/entities/signup_entity.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';

class SignUpInteractor implements AsyncUseCase<String, SignUpEntity> {
  AuthRepository repository;
  SignUpInteractor({
    required this.repository,
  });

  @override
  Future<Either<Failure, String>> call(param) async {
    try {
      final res = await repository.signupwithEmailPassword(param);
      return Right(res);
    } on CustomException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
