import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/controllers/movies/movies_binding.dart';
import 'package:movie_app/presentation/controllers/movies/movies_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MoviesController _moviesController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    MoviesBinding().dependencies();
    _moviesController = Get.find();
    _moviesController.fetchData('');
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: _moviesController,
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text('Movies')),
          body: ListView.builder(
            controller: _scrollController,
            itemCount: _moviesController.movies.length,
            itemBuilder: (context, index) {
              final movie = _moviesController.movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
                onTap: () {
                  // Navigate to movie detail page
                },
              );
            },
          ),
        );
      },
    );
  }

  _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      _moviesController.loadMore('');
    }
  }
}
