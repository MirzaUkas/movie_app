import 'package:movie_app/core/base/base_param_use_case.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class DeleteFavoriteMovieUseCase extends BaseParamUseCase<void, int> {
  final MovieRepository _repo;

  DeleteFavoriteMovieUseCase(this._repo);

  @override
  Future<void> execute(int id) {
    return _repo.deleteFavorite(id);
  }
}
