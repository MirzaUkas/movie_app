import 'package:hive/hive.dart';

import '../../../domain/entities/movie.dart';

part 'movie_hive.g.dart';

@HiveType(typeId: 0)
class MovieHive {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String urlPoster;
  @HiveField(4)
  final DateTime releasedAt;

  MovieHive({
    required this.id,
    required this.title,
    required this.overview,
    required this.releasedAt,
    required this.urlPoster,
  });
}

extension MovieHiveConverter on MovieHive {
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      voteAverage: 0.0,
      voteCount: 0,
      genres:[],
      urlPoster: urlPoster,
      urlBackdrop: "",
      releasedAt: releasedAt
    );
  }
}