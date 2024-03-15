import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/features/auth/domain/entities/login_enity.dart';
import 'package:clean_arch_application/features/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signupwithEmailPassword(
      {SignUpEntity signupEntity});

  Future<Either<Failure, String>> loginwithEmailPassword(
      {LoginEntity loginEntity});
}
