import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';

import 'package:clean_arch_application/features/auth/domain/entities/user.dart';
import 'package:clean_arch_application/features/auth/domain/usecases/signup_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpInteractor interactor;

  AuthBloc({required this.interactor}) : super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await interactor(event.param);
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
