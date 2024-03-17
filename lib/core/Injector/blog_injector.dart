import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/data/repositories/blog_repository_impl.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/blog_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BlogInjector {
  static init() {
    DI.instance.registerLazySingleton<BlogRemoteDatatSource>(
      () => BlogRemoteDataSourceImpl(
        client: DI.instance<SupabaseClient>(),
      ),
    );
    DI.instance.registerLazySingleton<BlogRepository>(
      () => BlogRepositoryImpl(
        dataSource: DI.instance<BlogRemoteDatatSource>(),
      ),
    );
    DI.instance.registerLazySingleton<BlogInteractor>(
      () => BlogInteractor(
        repository: DI.instance<BlogRepository>(),
      ),
    );
    DI.instance.registerFactory<BlogCubit>(
      () => BlogCubit(
        interactor: DI.instance<BlogInteractor>(),
      ),
    );
  }
}
