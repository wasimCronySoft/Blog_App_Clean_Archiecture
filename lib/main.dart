import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/core/cubits/app_user/app_user_cubit.dart';

import 'package:clean_arch_application/core/routes/routes.dart';
import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/core/theme/app_theme.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/login_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:clean_arch_application/wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppUserCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            singupInteractor: DI.instance<SignUpInteractor>(),
            loginInteractor: DI.instance<LoginInteractor>(),
            userInteractor: DI.instance(),
            appUserCubit: DI.instance(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.ligthTheme,
        onGenerateRoute: RoutesGenerator.generateRoutes,
        initialRoute: Routes.login,
        home: const Wrapper(),
      ),
    );
  }
}
