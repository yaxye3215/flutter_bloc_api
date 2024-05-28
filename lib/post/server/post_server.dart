import 'package:flutter_bloc_api/post/models/post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<PostModel>> fetchPosts() async {
    print("initial event");
    final List<PostModel> posts = [];

    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode == 200) {
        // Decode the JSON response into a list of dynamic objects.
        final List<dynamic> result = jsonDecode(response.body);
        // Convert each dynamic object to a PostModel.
        for (var item in result) {
          posts.add(
            PostModel.fromJson(item),
          ); // Ensure you have a fromJson constructor in your PostModel class.
        }
        // emit(PostSucccessFetching(posts));
        return posts;
      } else {
        // Handle non-200 responses.
        return [];
        // emit(PostFailureFetching('Failed to fetch posts: ${response.statusCode}'));
      }
    } catch (e) {
      // Handle errors such as network issues or parsing errors.
      // emit(PostFailureFetching('Failed to fetch posts: $e'));
      return [];
    }
  }
}
