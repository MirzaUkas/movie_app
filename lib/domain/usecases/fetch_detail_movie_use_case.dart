import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class FetchDetailMovieUseCase extends BaseParamUseCase<Movie, int> {
  final MovieRepository _repo;

  FetchDetailMovieUseCase(this._repo);

  @override
  Future<Movie> execute(int id) {
    return _repo.fetchDetailMovie(id);
  }
}
