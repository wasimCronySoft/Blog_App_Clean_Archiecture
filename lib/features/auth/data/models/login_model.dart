import 'package:clean_arch_application/features/auth/domain/entities/login_enity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required this.email, required this.password})
      : super(email: email, password: password);
  final String email;
  final String password;
}
