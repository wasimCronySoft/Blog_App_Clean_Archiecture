import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/core/constants/api_key.dart';
import 'package:clean_arch_application/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_arch_application/features/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/login_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/user_interactor.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthInjector {
  static init() async {
    final supabase = await Supabase.initialize(
      url: ApiKey.urlKey,
      anonKey: ApiKey.apiKey,
      debug: kDebugMode,
      storageOptions: const StorageClientOptions(),
    );

    DI.instance.registerLazySingleton<SupabaseClient>(
      () => supabase.client,
    );

    DI.instance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(
        client: DI.instance<SupabaseClient>(),
      ),
    );

    DI.instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dataSource: DI.instance<AuthRemoteDataSource>(),
      ),
    );

    //Sign up
    DI.instance.registerLazySingleton<SignUpInteractor>(
      () => SignUpInteractor(
        repository: DI.instance<AuthRepository>(),
      ),
    );

    //Login

    DI.instance.registerLazySingleton<LoginInteractor>(
      () => LoginInteractor(
        repository: DI.instance<AuthRepository>(),
      ),
    );

    DI.instance.registerLazySingleton<UserInteractor>(
      () => UserInteractor(
        repository: DI.instance<AuthRepository>(),
      ),
    );

    DI.instance.registerFactory<AppUserCubit>(
      () => AppUserCubit(),
    );

    //Bloc
    DI.instance.registerFactory<AuthBloc>(
      () => AuthBloc(
        singupInteractor: DI.instance<SignUpInteractor>(),
        loginInteractor: DI.instance<LoginInteractor>(),
        userInteractor: DI.instance<UserInteractor>(),
        appUserCubit: DI.instance<AppUserCubit>(),
      ),
    );
  }
}
