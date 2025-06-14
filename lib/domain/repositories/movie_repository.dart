import '../entities/movie.dart';
import '../entities/paging.dart';

abstract class MovieRepository {
  Future<Paging> fetchMovies(int page, int pageSize);

  Future<Paging> searchMovies(int page, int pageSize, String query);

  Future<Movie> fetchDetailMovie(int id);

  Future<void> addFavorite(Movie movie);

  Future<Movie?> getFavorite(int id);

  Future<void> deleteFavorite(int id);

  Future<List<Movie>> getFavoriteMovies();
}
