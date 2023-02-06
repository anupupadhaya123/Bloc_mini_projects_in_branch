import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/data_services.dart';
import 'package:pull_refresh/posts_event.dart';
import 'package:pull_refresh/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataServices = DataService();
  PostsBloc() : super(LoadingState()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefreshEvent) {
        emit(LoadingState());
        try {
          final posts = await _dataServices.getPosts();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FailedToLoadState(error: e.toString()));
        }
      }
    });
  }
}
