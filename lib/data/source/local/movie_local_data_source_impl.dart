import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:hive/hive.dart';
import 'package:movie_app/data/source/local/movie_hive.dart';
import 'package:movie_app/data/source/local/movie_local_data_source.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:path_provider/path_provider.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final _kMoviesBox = 'movies_box';

  @override
  Future<void> addFavMovie(Movie movie) async {
    final moviesBox = Hive.box<MovieHive>(_kMoviesBox);
    await moviesBox.add(
      MovieHive(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        releasedAt: movie.releasedAt,
        urlPoster: movie.urlPoster,
      ),
    );
    return Future.value();
  }

  @override
  Future<void> deleteAllFavMovies() async {
    final movieBox = Hive.box<MovieHive>(_kMoviesBox);
    await movieBox.clear();
    return Future.value();
  }

  @override
  Future<void> deleteFavMovie(int id) async {
    final movieBox = Hive.box<MovieHive>(_kMoviesBox);
    final key =
        movieBox
            .toMap()
            .entries
            .firstWhereOrNull((entry) => entry.value.id == id)
            ?.key;
    if (key != null) {
      await movieBox.delete(key);
    }
    return Future.value();
  }

  @override
  Future<List<Movie>> getFavMovies() {
    final movieBox = Hive.box<MovieHive>(_kMoviesBox);
    final result = movieBox.values.map((e) => e.toEntity()).toList();
    return Future.value(result);
  }

  @override
  Future<bool> initDb() async {
    if (!foundation.kIsWeb) {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }
    Hive.registerAdapter(MovieHiveAdapter());
    await Hive.openBox<MovieHive>(_kMoviesBox);
    return true;
  }

  @override
  Future<Movie?> getFavMovieById(int id) async {
    final movieBox = Hive.box<MovieHive>(_kMoviesBox);
    return movieBox.values.firstWhereOrNull((e) => e.id == id)?.toEntity();
  }
}
