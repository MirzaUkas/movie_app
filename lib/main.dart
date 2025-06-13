import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/pages/home/home_page.dart';

import 'core/di/dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyCreator.init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      home: const HomePage(),
    );
  }
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetCupertinoApp(
//       initialRoute: "/",
//       initialBinding: AuthBinding(),
//       home: HomePage(),
//     );
//   }
// }
