import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/color_extension.dart';
import '../../../../core/themes/theme_border_circular.dart';
import '../../../../core/themes/theme_fonts.dart';
import '../../../../core/themes/theme_padding.dart';
import '../../../../domain/entities/movie.dart';

class FavoriteWidget extends StatelessWidget {
  final Movie movie;
  final VoidCallback onDelete;

  const FavoriteWidget({super.key, required this.movie, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: movie.urlPoster,
              fit: BoxFit.cover,
              imageBuilder:
                  (context, imageProvider) => SizedBox.expand(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: ThemeBorderCircular.ba12,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              placeholder:
                  (context, url) =>
                      CircularProgressIndicator(padding: ThemePadding.pa20),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton.filled(
              style: IconButton.styleFrom(backgroundColor: HexColor("5474FF")),
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: ThemeBorderCircular.ba8,
              ),
              child: Padding(
                padding: ThemePadding.pa8,
                child: Text(
                  movie.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: ThemeFonts.bodyXSmall.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
