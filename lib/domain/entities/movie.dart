class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.urlPoster,
    required this.urlBackdrop,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
    required this.releasedAt,
  });

  int id;
  String title;
  String overview;
  String urlPoster;
  String urlBackdrop;
  double voteAverage;
  int voteCount;
  List<String> genres;
  DateTime releasedAt;
}
