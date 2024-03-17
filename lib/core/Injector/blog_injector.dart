import 'package:clean_arch_application/core/Injector/injector.dart';
import 'package:clean_arch_application/core/network/internet_checker.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_local_data_source.dart';
import 'package:clean_arch_application/features/homepage/data/datasources/blog_remote_data_source.dart';
import 'package:clean_arch_application/features/homepage/data/repositories/blog_repository_impl.dart';
import 'package:clean_arch_application/features/homepage/domain/repositories/blog_repository.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/fetch_blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/domain/usecases/upload_blog_interactor.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/fetch_blog_cubit.dart';
import 'package:clean_arch_application/features/homepage/presentation/cubit/upload_blog_cubit.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BlogInjector {
  static init() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

    DI.instance.registerLazySingleton<BlogRemoteDatatSource>(
      () => BlogRemoteDataSourceImpl(
        client: DI.instance<SupabaseClient>(),
      ),
    );

    DI.instance.registerLazySingleton<BlogLocalDataSource>(
      () => BlogLocalDataSourceImpl(box: Hive.box(name: 'blogs')),
    );

    DI.instance.registerFactory<InternetConnection>(() => InternetConnection());

    DI.instance.registerLazySingleton<ConnectionChecker>(
      () => ConnectionCheckerImpl(
        internetConnection: DI.instance<InternetConnection>(),
      ),
    );

    DI.instance.registerLazySingleton<BlogRepository>(
      () => BlogRepositoryImpl(
        remoteDatatSource: DI.instance<BlogRemoteDatatSource>(),
        blogLocalDataSource: DI.instance<BlogLocalDataSource>(),
        connectionChecker: DI.instance<ConnectionChecker>(),
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
