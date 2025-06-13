import 'package:movie_app/core/base/base_api_request.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/service/api_service.dart';

enum MovieType { list, search, detail }

class MovieApi implements BaseApiRequest {
  final MovieType type;
  String? keyword;
  int? page;
  int? pageSize;

  MovieApi._({required this.type, this.keyword, this.page, this.pageSize});

  MovieApi.fetchMovies(int page, int pageSize)
    : this._(type: MovieType.list, page: page, pageSize: pageSize);

  MovieApi.detailMovie(String keyword, int page, int pageSize)
    : this._(
        type: MovieType.detail,
        keyword: keyword,
        page: page,
        pageSize: pageSize,
      );

  @override
  get body => throw UnimplementedError();

  @override
  Map<String, String>? get headers => {
    "Authorization": "Bearer <<token>>",
    "Content-Type": "application/json",
  };

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  String get path {
    switch (type) {
      case MovieType.list:
        return ApiConstants.movies;
      case MovieType.search:
        return ApiConstants.discover;
      case MovieType.detail:
        return ApiConstants.detail;
    }
  }

  @override
  Map<String, String>? get query {
    switch (type) {
      case MovieType.list:
        return {"language": "en-US", "page": "$page"};
      case MovieType.search:
        return {"language": "en-US", "page": "$page", "with_keywords": keyword ?? ""};
      case MovieType.detail:
        return null;
    }
  }

  @override
  Future request() => ApiService.instance.request(this);

  @override
  String get url => ApiConstants.baseUrl + path;
}
