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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            singupInteractor: DI.instance<SignUpInteractor>(),
            loginInteractor: DI.instance<LoginInteractor>(),
            userInteractor: DI.instance(),
            appUserCubit: DI.instance(),
          ),
        )
      ],
      child: const LoginBody(),
    );
  }
}
