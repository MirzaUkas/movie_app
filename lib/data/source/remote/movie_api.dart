import 'package:movie_app/core/base/base_api_request.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/service/api_service.dart';

enum MovieType { list, search, detail }

class MovieApi extends BaseApiRequest {
  final MovieType type;
  String? keyword;
  int? page;
  int? id;
  int? pageSize;

  MovieApi._({required this.type, this.keyword, this.page, this.pageSize, this.id});

  MovieApi.fetchMovies(int page, int pageSize)
    : this._(type: MovieType.list, page: page, pageSize: pageSize);

  MovieApi.searchMovies(int page, int pageSize, String keyword)
    : this._(
        type: MovieType.search,
        page: page,
        pageSize: pageSize,
        keyword: keyword,
      );

  MovieApi.detailMovie(int id) : this._(type: MovieType.detail, id: id);

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path {
    switch (type) {
      case MovieType.list:
        return ApiConstants.movies;
      case MovieType.search:
        return ApiConstants.search;
      case MovieType.detail:
        return ApiConstants.detail + id.toString();
    }
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case MovieType.list:
        return {"page": "$page"};
      case MovieType.search:
        return {"page": "$page", "query": keyword ?? ""};
      case MovieType.detail:
        return null;
    }
  }

  @override
  Future request() => ApiService.instance.request(this);
}
