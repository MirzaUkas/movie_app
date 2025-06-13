import 'package:get/get.dart';
import 'package:movie_app/data/repositories/movie_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => MovieRepositoryImpl());
  }
}
