import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/core/cubits/app_user/app_user_cubit.dart';

import 'package:clean_arch_application/core/routes/routes.dart';
import 'package:clean_arch_application/core/theme/app_theme.dart';
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
        BlocProvider<AppUserCubit>(
          create: (context) => DI.instance<AppUserCubit>(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => DI.instance<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.ligthTheme,
        onGenerateRoute: RoutesGenerator.generateRoutes,
        home: const Wrapper(),
      ),
    );
  }
}
