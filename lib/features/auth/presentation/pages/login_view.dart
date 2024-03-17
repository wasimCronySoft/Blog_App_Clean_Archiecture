import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/login_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_application/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
