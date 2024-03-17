import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/data/repositories/blog_repository_impl.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/fetch_blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/upload_blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/fetch_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
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
    DI.instance.registerLazySingleton<UploadBlogInteractor>(
      () => UploadBlogInteractor(
        repository: DI.instance<BlogRepository>(),
      ),
    );

    DI.instance.registerLazySingleton<FetchBlogInteractor>(
      () => FetchBlogInteractor(
        repository: DI.instance<BlogRepository>(),
      ),
    );
    DI.instance.registerFactory<UploadBlogCubit>(
      () => UploadBlogCubit(
        interactor: DI.instance<UploadBlogInteractor>(),
      ),
    );
    DI.instance.registerFactory<FetchBlogsCubit>(
      () => FetchBlogsCubit(
        interactor: DI.instance<FetchBlogInteractor>(),
      ),
    );
  }
}
