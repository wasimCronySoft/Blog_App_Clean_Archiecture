// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUp extends AuthEvent {
  final SignUpEntity entity;
  const AuthSignUp({
    required this.entity,
  });
}

class AuthLogin extends AuthEvent {}

class AuthLogout extends AuthEvent {}
