import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/post.dart';
import 'package:pull_refresh/posts_bloc.dart';
import 'package:pull_refresh/posts_event.dart';

import 'package:pull_refresh/posts_state.dart';

class PostVIew extends StatelessWidget {
  const PostVIew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pull to Refresh"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<PostsBloc>().add(PullToRefreshEvent()),
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    Post posts = state.posts[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(posts.id.toString()),
                        ),
                        title: Text(
                          posts.title.toLowerCase(),
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          posts.body.toString(),
                          maxLines: 1,
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is FailedToLoadState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
