import 'package:get/get.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_favorite_movies_use_case.dart';

import '../../../domain/usecases/delete_favorite_movie_use_case.dart';
import 'favorite_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetFavoriteMoviesUseCase(Get.find<MovieRepositoryImpl>()),
    );
    Get.lazyPut(
      () => DeleteFavoriteMovieUseCase(Get.find<MovieRepositoryImpl>()),
    );
    Get.lazyPut(() => FavoriteController(Get.find(), Get.find()));
  }
}
