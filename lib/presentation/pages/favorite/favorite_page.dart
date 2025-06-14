import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/controllers/favorites/favorite_binding.dart';
import 'package:movie_app/presentation/controllers/favorites/favorite_controller.dart';
import 'package:movie_app/presentation/pages/favorite/widgets/favorite_widget.dart';

import '../../../core/themes/theme_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteController _favoriteController;

  @override
  void initState() {
    super.initState();
    FavoritesBinding().dependencies();
    _favoriteController = Get.find();
    _favoriteController.getFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: _favoriteController,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Favorites"),
            titleTextStyle:  ThemeFonts.titleSmall.copyWith(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 8,
          ),
          body:  _favoriteController.movies.isNotEmpty?  GridView.builder(
            itemCount: _favoriteController.movies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 4,
            ),
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final movie = _favoriteController.movies[index];
              return FavoriteWidget(
                movie: movie,
                onDelete: () {
                  _favoriteController.deleteFavorite(movie.id);
                },
              );
            },
          ) : Center(
            child: Text(
              "Empty Favorites",
              style: ThemeFonts.bodySmall,
            ),
          ),
        );
      },
    );
  }
}
