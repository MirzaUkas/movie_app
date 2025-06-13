import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:tuple/tuple.dart';

import '../entities/paging.dart';

class FetchMoviesUseCase
    extends BaseParamUseCase<Paging, Tuple3<int, int, String>> {
  final MovieRepository _repo;

  FetchMoviesUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple3 param) {
    return param.item3.toString().isNotEmpty
        ? _repo.searchMovies(param.item1, param.item2, param.item3.toString())
        : _repo.fetchMovies(param.item1, param.item2);
  }
}
