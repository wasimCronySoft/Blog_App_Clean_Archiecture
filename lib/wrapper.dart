import 'package:clean_arch_application/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/login_view.dart';
import 'package:clean_arch_application/features/homepage/presentation/pages/hompage_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppUserCubit, AppUserState, bool>(
      selector: (state) {
        return state is AppUserLoggedIn;
      },
      builder: (context, state) {
        if (state) {
          return const HomepageView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}
