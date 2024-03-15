import 'package:clean_arch_application/core/error/exception.dart';
import 'package:supabase/supabase.dart';

import 'package:clean_arch_application/features/auth/data/models/login_model.dart';
import 'package:clean_arch_application/features/auth/data/models/signup_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signupWithEmail(SignUpModel signUpModel);
  Future<String> loginWithEmail(LoginModel loginModel);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  SupabaseClient client;
  AuthRemoteDataSourceImp({
    required this.client,
  });
  @override
  Future<String> loginWithEmail(LoginModel loginModel) async {
    try {
      final res = await client.auth.signInWithPassword(
          email: loginModel.email, password: loginModel.password);
      return res.user!.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signupWithEmail(SignUpModel signUpModel) async {
    try {
      final res = await client.auth.signUp(
        email: signUpModel.email,
        password: signUpModel.password,
        data: {'name': signUpModel.name},
      );
      if (res.user == null) throw CustomException(message: "User is null");
      return res.user!.id;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
