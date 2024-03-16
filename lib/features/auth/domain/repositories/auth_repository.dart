import 'package:clean_arch_application/features/auth/data/models/user_model.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';

abstract interface class AuthRepository {
  Future<UserModel> signupwithEmailPassword(SignupParam param);

  Future<UserModel> loginwithEmailPassword(LoginParam param);

  Future<UserModel?> getCurrentUserData();
}
