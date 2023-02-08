import 'dart:convert';
import 'dart:developer';

import 'package:pull_refresh/model/post.dart';
import 'package:http/http.dart' as http;

class DataService {
  final _baseUrl = "jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(_baseUrl, "/posts");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        final posts = json.map((e) => Post.fromJson(e)).toList();
        log(posts.toString());
        return posts;
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      rethrow;
    }
  }
}
