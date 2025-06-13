import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/paging.dart';
import 'movie_model.dart';

part 'paging_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class PagingModel {
  PagingModel({
    required this.totalResults,
    required this.results,
    required this.page,
  });

  final int totalResults;
  final int page;
  final List<MovieModel> results;

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);
}

extension PagingModelConverter on PagingModel {
  Paging toEntity() {
    return Paging(
      totalResults: totalResults,
      page: page,
      results: results.map((e) => e.toEntity()).toList(),
    );
  }
}
