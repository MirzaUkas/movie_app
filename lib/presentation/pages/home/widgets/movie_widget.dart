import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:movie_app/core/extensions/color_extension.dart';
import 'package:movie_app/core/extensions/number_extension.dart';
import 'package:movie_app/core/themes/theme_border_circular.dart';
import 'package:movie_app/core/themes/theme_fonts.dart';
import 'package:movie_app/core/themes/theme_padding.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/pages/detail/detail_page.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(), arguments: movie.id);
      },
      child: Container(
        padding: ThemePadding.pa16,
        decoration: BoxDecoration(
          color: HexColor("FAFAFA"),
          borderRadius: ThemeBorderCircular.ba12,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 88.ds,
              height: 88.ds,
              imageUrl: movie.urlPoster,
              imageBuilder:
                  (context, imageProvider) => Container(
                    width: 88.ds,
                    height: 88.ds,
                    decoration: BoxDecoration(
                      borderRadius: ThemeBorderCircular.ba12,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              placeholder:
                  (context, url) =>
                      CircularProgressIndicator(padding: ThemePadding.pa20),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(width: 12.ds),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: ThemeFonts.titleSmall),
                  const SizedBox(height: 8),
                  Text(
                    movie.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeFonts.labelXSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    Jiffy.parseFromDateTime(movie.releasedAt).yMMMd,
                    style: ThemeFonts.labelXSmall.copyWith(
                      color: HexColor("A9A9A9"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
