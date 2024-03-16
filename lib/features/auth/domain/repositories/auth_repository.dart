import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';
import 'package:clean_arch_application/core/entities/user.dart';

abstract interface class AuthRepository {
  Future<User> signupwithEmailPassword(SignupParam param);

  Future<User> loginwithEmailPassword(LoginParam param);

  Future<User?> getCurrentUserData();
}
