import 'package:movie_app/core/base/base_use_case.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetFavoriteMoviesUseCase extends BaseUseCase<List<Movie>> {
  final MovieRepository _repo;

  GetFavoriteMoviesUseCase(this._repo);

  @override
  Future<List<Movie>> execute() {
    return _repo.getFavoriteMovies();
  }
}
