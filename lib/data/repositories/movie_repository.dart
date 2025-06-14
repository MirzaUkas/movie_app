import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/source/remote/movie_api.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/paging.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../models/paging_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Movie> fetchDetailMovie(int id) async {
    final response = await MovieApi.detailMovie(id).request();
    return MovieModel.fromJson(response).toEntity();
  }

  @override
  Future<Paging> fetchMovies(int page, int pageSize) async {
    final response = await MovieApi.fetchMovies(page, pageSize).request();
    return PagingModel.fromJson(response).toEntity();
  }

  @override
  Future<Paging> searchMovies(int page, int pageSize, String query) async {
    final response =
        await MovieApi.searchMovies(page, pageSize, query).request();
    return PagingModel.fromJson(response).toEntity();
  }
}
