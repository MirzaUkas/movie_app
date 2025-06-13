import 'package:json_annotation/json_annotation.dart';

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
  DateTime? releaseDate;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
