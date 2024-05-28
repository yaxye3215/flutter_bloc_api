import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/post/bloc/post_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostiniatialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Page"),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostSucccessFetching:
              final successState = state as PostSucccessFetching;
              return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          successState.posts[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(successState.posts[index].body),
                      ],
                    ),
                  );
                },
              );
            case PostLoadingFetching:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
