import 'dart:convert';
import 'dart:io';

import 'package:movie_app/data/models/paging_model.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/paging.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class MockMovieRepository extends MovieRepository {


  @override
  Future<void> addFavorite(Movie movie) {
    // TODO: implement addFavorite
    return Future.value();
  }

  @override
  Future<void> deleteFavorite(int id) {
    // TODO: implement deleteFavorite
    return Future.value();
  }

  @override
  Future<Movie> fetchDetailMovie(int id) {
    // TODO: implement fetchDetailMovie
    final mockMovie = Movie(
      id: 1,
      title: "Test Movie",
      overview: "This is a test movie overview.",
      urlPoster: "/test_poster.jpg",
      releasedAt: DateTime.now(),
      voteAverage: 8.0,
      voteCount: 1,
      urlBackdrop: "/test_poster.jpg",
      genres: [],
    );
    return Future.value(mockMovie);
  }

  @override
  Future<Paging> fetchMovies(int page, int pageSize) async {
    final file = File('test/data/movies_response.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data).toEntity();
  }

  @override
  Future<Movie?> getFavorite(int id) {
    // TODO: implement getFavorite
    return Future.value(null);
  }

  @override
  Future<List<Movie>> getFavoriteMovies() {
    // TODO: implement getFavoriteMovies
   return Future.value([]);
  }

  @override
  Future<Paging> searchMovies(int page, int pageSize, String query) async {
    final file = File('test/data/movies_response.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return PagingModel.fromJson(data).toEntity();
  }
}
