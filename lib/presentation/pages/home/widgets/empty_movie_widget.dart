import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/extensions/number_extension.dart';

import '../../../../core/extensions/color_extension.dart';
import '../../../../core/themes/theme_fonts.dart';

class EmptyMovieWidget extends StatelessWidget {
  const EmptyMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16.ds,
        children: [
          Text("No movies found", style: ThemeFonts.titleMedium),
          Text(
            "There is nothing here.\nWe will notify you if something coming.",
            textAlign: TextAlign.center,
            style: ThemeFonts.bodyXSmall.copyWith(
              color: HexColor("A9A9A9"),
            ),
          ),
        ],
      ),
    );
  }
}
