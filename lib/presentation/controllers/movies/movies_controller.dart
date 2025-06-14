import 'package:get/get.dart';
import 'package:movie_app/domain/usecases/add_favorite_movie_use_case.dart';
import 'package:movie_app/domain/usecases/fetch_movies_use_case.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/entities/paging.dart';
import '../../../domain/usecases/delete_favorite_movie_use_case.dart';
import '../../../domain/usecases/fetch_detail_movie_use_case.dart';

class MoviesController extends GetxController {
  MoviesController(
    this._fetchMoviesUseCase,
    this._fetchDetailMovieUseCase,
    this._addFavoriteMovieUseCase,
    this._deleteFavoriteMovieUseCase,
  );

  final FetchMoviesUseCase _fetchMoviesUseCase;
  final FetchDetailMovieUseCase _fetchDetailMovieUseCase;
  final AddFavoriteMovieUseCase _addFavoriteMovieUseCase;
  final DeleteFavoriteMovieUseCase _deleteFavoriteMovieUseCase;

  int _currentPage = 1;
  final int _pageSize = 20;
  var _isLoadMore = false;
  final _paging = Rx<Paging?>(null);
  var movie = Rx<Movie?>(null);

  var movies = RxList<Movie>([]);

  fetchData(String keyword) async {
    _currentPage = 1;
    final newPaging = await _fetchMoviesUseCase.execute(
      Tuple3(_currentPage, _pageSize, keyword),
    );
    movies.assignAll(newPaging.results);
    _paging.value = newPaging;
  }

  fetchDetail(int id) async {
    final result = await _fetchDetailMovieUseCase.execute(id);
    movie.value = result;
  }

  addFavorite(Movie movie) async {
    await _addFavoriteMovieUseCase.execute(movie);
    this.movie.value = this.movie.value?.copyWith(isFavorite: true);
  }

  deleteFavorite(int id) async {
    await _deleteFavoriteMovieUseCase.execute(id);
    movie.value = movie.value?.copyWith(isFavorite: false);
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
