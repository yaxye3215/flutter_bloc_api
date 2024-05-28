import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_api/post/server/post_server.dart';
import 'package:meta/meta.dart';

import '../models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostiniatialEvent>(postiniatialEvent);
  }

  FutureOr<void> postiniatialEvent(
      PostiniatialEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingFetching());
    List<PostModel> posts = [];
    posts = await PostService.fetchPosts();
    emit(PostSucccessFetching(posts: posts));
  }
}
