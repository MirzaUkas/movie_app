import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:tuple/tuple.dart';

import '../entities/paging.dart';

class FetchMoviesUseCase extends BaseParamUseCase<Paging, Tuple2<int, int>> {
  final MovieRepository _repo;

  FetchMoviesUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple2 param) {
    return _repo.fetchMovies(param.item1, param.item2);
  }
}
