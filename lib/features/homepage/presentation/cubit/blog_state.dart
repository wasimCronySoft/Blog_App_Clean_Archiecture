part of 'blog_cubit.dart';

sealed class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogSuccess extends BlogState {
  final Blog? blog;
  const BlogSuccess({this.blog});
}

final class BlogFailure extends BlogState {
  final String message;
  const BlogFailure({required this.message});
}
