part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostSucccessFetching extends PostState {
  final List<PostModel> posts;

  PostSucccessFetching({required this.posts});
}

class PostLoadingFetching extends PostState {}
