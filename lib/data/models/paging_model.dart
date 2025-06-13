import 'package:movie_app/domain/entities/movie.dart';

import '../../domain/entities/paging.dart';
import 'movie_model.dart';

class PagingModel {
  PagingModel({
    required this.totalResults,
    required this.results,
    required this.page,
  });

  final int totalResults;
  final int page;
  final List<MovieModel> results;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
    totalResults: json["totalResults"],
    page: json["page"],
    results: List.from(json["results"].map((x) => MovieModel.fromJson(x))),
  );

}

extension PagingModelConverter on PagingModel {
  Paging toEntity() {
    return Paging(
      totalResults: totalResults,
      page: page,
      results: results.map((e) => Movie(
        id: e.id ?? 0,
        title: e.title ?? '',
        overview: e.overview ?? '',
        urlPoster: e.posterPath ?? '',
        releasedAt: e.releaseDate ?? DateTime.now(),
      )).toList(),
    );
  }
}
