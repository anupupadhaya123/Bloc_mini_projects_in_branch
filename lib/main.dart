import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/cubit/posts_cubit.dart';
import 'package:pull_refresh/data/repository/posts_repo.dart';
import 'package:pull_refresh/data/services/posts_service.dart';
import 'package:pull_refresh/presentation/posts_screen.dart';

void main() {
  runApp(PaginationApp(
    repository: PostsRepository(PostService()),
  ));
}

class PaginationApp extends StatelessWidget {
  final PostsRepository repository;

  const PaginationApp({super.key, required this.repository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostsScreen(),
      ),
    );
  }
}
