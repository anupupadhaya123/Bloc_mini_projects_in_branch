import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/view/post_view.dart';
import 'package:pull_refresh/bloc/posts_bloc.dart';
import 'package:pull_refresh/bloc/posts_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<PostsBloc>(
        create: (context) => PostsBloc()..add(LoadEvent()),
        child: const PostVIew(),
      ),
    );
  }
}
