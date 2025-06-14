import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/core/constants/api_constants.dart';

import '../../domain/entities/movie.dart';
import 'genre_model.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel {
  MovieModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.genres,
  });

  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  @JsonKey(defaultValue: [])
  List<GenreModel>? genres;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

extension MovieModelConverter on MovieModel {
  Movie toEntity() {
    return Movie(
      id: id ?? 0,
      title: title ?? '',
      overview: overview ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
      genres: genres?.map((genre) => genre.name ?? '').toList() ?? [],
      urlPoster: "${ApiConstants.imageBaseUrl}${posterPath ?? ''}",
      urlBackdrop: "${ApiConstants.imageBaseUrl}${backdropPath ?? ''}",
      releasedAt:
          releaseDate != null && releaseDate!.isNotEmpty
              ? Jiffy.parse(releaseDate!).dateTime
              : DateTime.now(),
    );
  }
}
