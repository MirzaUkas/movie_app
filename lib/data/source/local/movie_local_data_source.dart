import '../../../domain/entities/movie.dart';

abstract class MovieLocalDataSource {
  Future<bool> initDb();
  Future<List<Movie>> getFavMovies();
  Future<void> addFavMovie(Movie movie);
  Future<void> deleteFavMovie(int id);
  Future<void> deleteAllFavMovies();
  Future<Movie?> getFavMovieById(int id);
}