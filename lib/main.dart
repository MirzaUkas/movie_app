import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/utils/size_util.dart';
import 'package:movie_app/presentation/pages/detail/detail_page.dart';
import 'package:movie_app/presentation/pages/home/home_page.dart';

import 'core/di/dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize DI
  DependencyCreator.init();

  /// Initialize System UI Mode & Orientation
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtil.init(context);
    return GetMaterialApp(
      home: const HomePage(),
      getPages: [
        GetPage(name: "/", page: () => const HomePage()),
        GetPage(name: "/detail", page: () => const DetailPage()),
      ],
    );
  }
}