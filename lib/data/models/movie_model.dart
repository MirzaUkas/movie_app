import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel {
  MovieModel({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;

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
      urlPoster: "https://image.tmdb.org/t/p/original${posterPath ?? ''}",
      releasedAt:
          releaseDate != null && releaseDate!.isNotEmpty
              ? Jiffy.parse(releaseDate!).dateTime
              : DateTime.now(),
    );
  }
}
