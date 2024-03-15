// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:clean_arch_application/core/error/failure.dart';
import 'package:clean_arch_application/features/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_application/features/auth/domain/entities/login_enity.dart';
import 'package:clean_arch_application/features/auth/domain/entities/signup_entity.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<String> loginwithEmailPassword(LoginEntity loginEntity) async {
    final res = await dataSource.loginWithEmail(loginEntity);
    return res;
  }

  @override
  Future<String> signupwithEmailPassword(SignUpEntity signupEntity) async {
    final res = await dataSource.signupWithEmail(signupEntity);
    return res;
  }
}
