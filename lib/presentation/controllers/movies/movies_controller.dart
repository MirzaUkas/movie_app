import 'package:get/get.dart';
import 'package:movie_app/domain/usecases/fetch_movies_use_case.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/paging.dart';

class MoviesController extends GetxController {
  MoviesController(this._fetchMoviesUseCase);

  final FetchMoviesUseCase _fetchMoviesUseCase;
  int _currentPage = 1;
  final int _pageSize = 20;
  var _isLoadMore = false;
  final _paging = Rx<Paging?>(null);

  var movies = RxList<Movie>([]);

  fetchData(String keyword) async {
    _currentPage = 1;
    final newPaging = await _fetchMoviesUseCase.execute(
      Tuple3(_currentPage, _pageSize, keyword),
    );
    movies.assignAll(newPaging.results);
    _paging.value = newPaging;
  }

  loadMore(String keyword) async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _fetchMoviesUseCase.execute(
      Tuple3(_currentPage, _pageSize, keyword),
    );
    movies.addAll(newPaging.results);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
