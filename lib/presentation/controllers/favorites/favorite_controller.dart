import 'package:get/get.dart';
import 'package:movie_app/domain/usecases/get_favorite_movies_use_case.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/delete_favorite_movie_use_case.dart';

class FavoriteController extends GetxController {
  FavoriteController(
    this._getFavoriteMoviesUseCase,
    this._deleteFavoriteMovieUseCase,
  );

  final GetFavoriteMoviesUseCase _getFavoriteMoviesUseCase;
  final DeleteFavoriteMovieUseCase _deleteFavoriteMovieUseCase;

  var movies = RxList<Movie>([]);

  getFavorite() async {
    final result = await _getFavoriteMoviesUseCase.execute();
    movies.assignAll(result);
  }

  deleteFavorite(int id) async {
    await _deleteFavoriteMovieUseCase.execute(id);
    getFavorite();
  }
}
