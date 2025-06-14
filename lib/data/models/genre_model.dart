import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreModel {
  GenreModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}