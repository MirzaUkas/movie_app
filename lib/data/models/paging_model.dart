import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entities/movie.dart';

import '../../domain/entities/paging.dart';
import 'movie_model.dart';

part 'paging_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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
      results:
          results
              .map(
                (e) => Movie(
                  id: e.id ?? 0,
                  title: e.title ?? '',
                  overview: e.overview ?? '',
                  urlPoster: e.posterPath ?? '',
                  releasedAt: e.releaseDate ?? DateTime.now(),
                ),
              )
              .toList(),
    );
  }
}
