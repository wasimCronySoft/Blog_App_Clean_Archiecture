// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_application/features/auth/domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity {
  String name;
  String email;
  String password;
  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
  }) : super(name: '', email: '', password: '');
}
