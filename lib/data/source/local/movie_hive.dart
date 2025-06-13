import 'package:hive/hive.dart';
part 'movie_hive.g.dart';

@HiveType(typeId: 0)
class MovieHive {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String overview;
  @HiveField(2)
  final String urlPoster;
  @HiveField(3)
  final String releasedAt;

  MovieHive({
    required this.title,
    required this.overview,
    required this.releasedAt,
    required this.urlPoster,
  });
}
