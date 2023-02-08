import 'package:pull_refresh/data/models/posts_models.dart';
import 'package:pull_refresh/data/services/posts_service.dart';

class PostsRepository {
  final PostService service;

  PostsRepository(this.service);
  Future<List<PostModel>> fetchPost(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => PostModel.fromJson(e)).toList();
  }
}
