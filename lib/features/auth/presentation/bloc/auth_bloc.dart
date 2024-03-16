import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';
import 'package:clean_arch_application/features/auth/domain/entities/user.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/login_interactor.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpInteractor singupInteractor;
  final LoginInteractor loginInteractor;

  AuthBloc({required this.singupInteractor, required this.loginInteractor})
      : super(AuthInitial()) {
    //Signup

    on<AuthSignUp>((event, emit) async {
      emit(const AuthLoading());
      final res = await singupInteractor(event.param);
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(
          AuthSuccess(
            user: r,
          ),
        ),
      );
    });

    //Login
    on<AuthLogin>((event, emit) async {
      emit(const AuthLoading());
      final res = await loginInteractor(event.param);
      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(
          AuthSuccess(
            user: r,
          ),
        ),
      );
    });
  }
}
