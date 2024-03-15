import 'package:clean_arch_application/features/auth/domain/entities/login_enity.dart';
import 'package:clean_arch_application/features/auth/domain/entities/signup_entity.dart';

abstract interface class AuthRepository {
  Future<String> signupwithEmailPassword({SignUpEntity signupEntity});

  Future<String> loginwithEmailPassword({LoginEntity loginEntity});
}
