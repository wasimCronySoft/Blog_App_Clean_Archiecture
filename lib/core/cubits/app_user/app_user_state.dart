// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

class AppUserInitial extends AppUserState {}

class AppUserLoggedIn extends AppUserState {
  final User user;
  const AppUserLoggedIn({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}
