import 'package:pull_refresh/post.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingState extends PostsState {}

class LoadedState extends PostsState {
  List<Post> posts;
  LoadedState({required this.posts});
}

class FailedToLoadState extends PostsState {
  String error;

  FailedToLoadState({required this.error});
}
