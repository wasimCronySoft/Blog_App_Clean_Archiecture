import 'package:clean_arch_application/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_arch_application/core/usecases/async_usecase.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';
import 'package:clean_arch_application/core/entities/user.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/login_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/user_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpInteractor singupInteractor;
  final LoginInteractor loginInteractor;
  final UserInteractor userInteractor;
  final AppUserCubit appUserCubit;

  AuthBloc({
    required this.singupInteractor,
    required this.loginInteractor,
    required this.userInteractor,
    required this.appUserCubit,
  }) : super(AuthInitial()) {
    //Signup

    on<AuthSignUp>((event, emit) async {
      emit(const AuthLoading());
      final res = await singupInteractor(event.param);
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => appUserSuccess(emit, r),
      );
    });

    //Login
    on<AuthLogin>((event, emit) async {
      emit(const AuthLoading());
      final res = await loginInteractor(event.param);
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => appUserSuccess(emit, r),
      );
    });

    //UserLoggedIn
    on<AuthIsUserLoggedIn>((event, emit) async {
      final res = await userInteractor(NoParams());
      res.fold(
        (l) => emit(
          AuthFailure(
            message: l.message,
          ),
        ),
        (r) => appUserSuccess(emit, r!),
      );
    });
  }
  //Appuser Cubit
  appUserSuccess(Emitter emit, User user) {
    appUserCubit.appUser(user);
    emit(AuthSuccess(user: user));
  }
}
