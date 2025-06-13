import '../entities/movie.dart';
import '../entities/paging.dart';

abstract class MovieRepository {
  Future<Paging> fetchMovies(int page, int pageSize);

  Future<Movie> fetchDetailMovie(int id);
}
