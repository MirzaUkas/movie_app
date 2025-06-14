import 'package:get/get.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';
import 'package:movie_app/data/source/local/movie_local_data_source_impl.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => MovieLocalDataSourceImpl());
    Get.lazyPut(() => MovieRepositoryImpl(Get.find<MovieLocalDataSourceImpl>()));
  }
}
