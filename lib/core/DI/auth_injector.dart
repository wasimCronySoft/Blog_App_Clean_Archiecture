import 'package:clean_arch_application/core/DI/injector.dart';
import 'package:clean_arch_application/core/constants/api_key.dart';
import 'package:clean_arch_application/features/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_application/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_arch_application/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase/supabase.dart';

class AuthInjector {
  static init() {
    DI.instance.registerLazySingleton<SupabaseClient>(
        () => SupabaseClient(ApiKey.urlKey, ApiKey.apiKey));
    DI.instance.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(client: DI.instance<SupabaseClient>()));
    DI.instance.registerLazySingleton<AuthRepository>(() =>
        AuthRepositoryImpl(dataSource: DI.instance<AuthRemoteDataSource>()));

    DI.instance.registerLazySingleton<SignUpInteractor>(
      () => SignUpInteractor(
        repository: DI.instance<AuthRepository>(),
      ),
    );

    DI.instance.registerFactory<AuthBloc>(
        () => AuthBloc(interactor: DI.instance<SignUpInteractor>()));
  }
}
