import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class AddFavoriteMovieUseCase extends BaseParamUseCase<void, Movie> {
  final MovieRepository _repo;

  AddFavoriteMovieUseCase(this._repo);

  @override
  Future<void> execute(Movie param) {
    return _repo.addFavorite(param);
  }
}
