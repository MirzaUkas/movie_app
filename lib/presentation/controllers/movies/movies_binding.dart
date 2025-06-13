import 'package:get/get.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/fetch_movies_use_case.dart';

import 'movies_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchMoviesUseCase(Get.find<MovieRepositoryImpl>()));
    Get.lazyPut(() => MoviesController(Get.find()));
  }
}
