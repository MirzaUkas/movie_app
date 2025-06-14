// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/domain/usecases/fetch_movies_use_case.dart';
import 'package:tuple/tuple.dart';

import 'repositories/mock_movie_repository.dart';

void main() {

  test('Fetch movies test', () async {
    //Mock input
    final keyword = "batman";
    final pageSize = 10;
    final currentPage = 1;

    //Mock data
    final fetchMovieUseCase = FetchMoviesUseCase(MockMovieRepository());
    final paging = await fetchMovieUseCase.execute(
      Tuple3(currentPage, pageSize, keyword),
    );

    // Verify that length of data is match.
    expect(paging.results.length, 20);
  });

}
