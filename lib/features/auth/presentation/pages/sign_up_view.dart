import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_application/features/auth/presentation/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            singupInteractor: DI.instance(),
            loginInteractor: DI.instance(),
          ),
        )
      ],
      child: const SignupBody(),
    );
  }
}
