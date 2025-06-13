class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.urlPoster,
    required this.releasedAt,
  });

  int id;
  String title;
  String overview;
  String urlPoster;
  DateTime releasedAt;
}
