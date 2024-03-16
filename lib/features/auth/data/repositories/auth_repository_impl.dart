// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clean_arch_application/features/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';
import 'package:clean_arch_application/core/entities/user.dart';

import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl({
    required this.dataSource,
  });
  @override
  Future<User> loginwithEmailPassword(LoginParam param) async {
    final res = await dataSource.loginWithEmail(param);
    return res;
  }

  @override
  Future<User> signupwithEmailPassword(SignupParam param) async {
    final res = await dataSource.signupWithEmail(param);
    return res;
  }

  @override
  Future<User?> getCurrentUserData() async {
    final res = await dataSource.getCurrentUserData();
    return res;
  }
}
