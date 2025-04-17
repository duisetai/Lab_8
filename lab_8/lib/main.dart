import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';
import 'repository/post_repository.dart';
import 'pages/posts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final postRepository = PostRepository();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PostBloc(postRepository)..add(LoadPosts()),
        child: const PostsPage(),
      ),
    );
  }
}
