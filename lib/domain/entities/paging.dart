import 'package:movie_app/domain/entities/movie.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.page,
    required this.results,
  });

  int totalResults;
  int page;
  List<Movie> results;
}
