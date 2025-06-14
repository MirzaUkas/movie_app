import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class FetchDetailMovieUseCase extends BaseParamUseCase<Movie, int> {
  final MovieRepository _repo;

  FetchDetailMovieUseCase(this._repo);

  @override
  Future<Movie> execute(int id) async {
    final isFavorite = await _repo.getFavorite(id).then((e) => e != null);
    return _repo
        .fetchDetailMovie(id)
        .then((movie) => movie.copyWith(isFavorite: isFavorite));
  }
}
