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
    this.isFavorite = false,
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
  bool isFavorite;

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? urlPoster,
    String? urlBackdrop,
    double? voteAverage,
    int? voteCount,
    List<String>? genres,
    DateTime? releasedAt,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      urlPoster: urlPoster ?? this.urlPoster,
      urlBackdrop: urlBackdrop ?? this.urlBackdrop,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
      releasedAt: releasedAt ?? this.releasedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
