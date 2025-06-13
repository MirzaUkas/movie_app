import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/extensions/color_extension.dart';
import 'package:movie_app/core/extensions/number_extension.dart';
import 'package:movie_app/core/themes/theme_fonts.dart';
import 'package:movie_app/core/themes/theme_padding.dart';
import 'package:movie_app/presentation/controllers/movies/movies_binding.dart';
import 'package:movie_app/presentation/controllers/movies/movies_controller.dart';
import 'package:movie_app/presentation/pages/home/widgets/movie_widget.dart';
import 'package:movie_app/presentation/pages/home/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MoviesController _moviesController;
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    MoviesBinding().dependencies();
    _moviesController = Get.find();
    _moviesController.fetchData('');
    _searchController.addListener(
      () => Future.delayed(
        Duration(milliseconds: 500),
        () => _moviesController.fetchData(_searchController.text),
      ),
    );
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
        _searchController.dispose();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Movies", style: ThemeFonts.titleSmall),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 8,
            bottom: SearchWidget(controller: _searchController),
          ),
          body:
              _moviesController.movies.isNotEmpty
                  ? ListView.separated(
                    padding: ThemePadding.ph16,
                    controller: _scrollController,
                    itemCount: _moviesController.movies.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return MovieWidget(
                        movie: _moviesController.movies[index],
                      );
                    },
                  )
                  : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16.ds,
                      children: [
                        Text("No movies found", style: ThemeFonts.titleMedium),
                        Text(
                          "There is nothing here.\nWe will notify you if something coming.",
                          textAlign: TextAlign.center,
                          style: ThemeFonts.bodyXSmall.copyWith(
                            color: HexColor("A9A9A9"),
                          ),
                        ),
                      ],
                    ),
                  ),
        );
      },
    );
  }

  _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      _moviesController.loadMore(_searchController.text);
    }
  }
}
