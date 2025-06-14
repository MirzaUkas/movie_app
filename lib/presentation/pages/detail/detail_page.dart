import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:movie_app/core/extensions/color_extension.dart';
import 'package:movie_app/core/extensions/number_extension.dart';
import 'package:movie_app/core/themes/theme_padding.dart';
import 'package:movie_app/core/utils/size_util.dart';

import '../../../core/themes/theme_border_circular.dart';
import '../../../core/themes/theme_fonts.dart';
import '../../../domain/entities/movie.dart';
import '../../controllers/movies/movies_binding.dart';
import '../../controllers/movies/movies_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late MoviesController _moviesController;

  @override
  void initState() {
    super.initState();
    MoviesBinding().dependencies();
    _moviesController = Get.find();
    _moviesController.fetchDetail(int.parse(Get.arguments.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: _moviesController,
      builder: (_) {
        Movie? movie = _moviesController.movie.value;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Detail Movie"),
            centerTitle: true,
            titleTextStyle:  ThemeFonts.titleSmall.copyWith(color: Colors.black),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 8,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: ThemePadding.pa16,
              child:
                  movie != null
                      ? Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: movie.urlBackdrop,
                            imageBuilder:
                                (context, imageProvider) => Container(
                                  width: SizeUtil.getScreenWidth,
                                  height: 200.ds,
                                  decoration: BoxDecoration(
                                    borderRadius: ThemeBorderCircular.ba12,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            placeholder:
                                (context, url) => CircularProgressIndicator(
                                  padding: ThemePadding.pa20,
                                ),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                          SizedBox(height: 24.ds),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              movie.genres.join(", "),
                              style: ThemeFonts.bodySmall.copyWith(
                                color: HexColor("3264FF"),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  movie.title.toString(),
                                  style: ThemeFonts.titleMedium,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  movie.isFavorite
                                      ? _moviesController.deleteFavorite(
                                        movie.id,
                                      )
                                      : _moviesController.addFavorite(movie);
                                },
                                style: IconButton.styleFrom(
                                  shape: CircleBorder(
                                    side: BorderSide(color: HexColor("E9E9E9")),
                                  ),
                                ),
                                icon: Icon(
                                  movie.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_rounded,
                                  color:
                                      movie.isFavorite
                                          ? HexColor("5474FF")
                                          : HexColor("E9E9E9"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.ds),
                          Row(
                            children: [
                              Icon(
                                Icons.how_to_vote,
                                color: HexColor("CACACA"),
                                size: 16.ds,
                              ),
                              SizedBox(width: 8),
                              Text(
                                movie.voteAverage.toString(),
                                style: ThemeFonts.labelXSmall.copyWith(
                                  color: HexColor("CACACA"),
                                ),
                              ),
                              SizedBox(width: 16.ds),
                              Icon(
                                Icons.calendar_month_outlined,
                                color: HexColor("CACACA"),
                                size: 16.ds,
                              ),
                              SizedBox(width: 8.ds),
                              Text(
                                Jiffy.parseFromDateTime(
                                  movie.releasedAt,
                                ).format(pattern: "dd MMMM yyyy"),
                                style: ThemeFonts.labelXSmall.copyWith(
                                  color: HexColor("CACACA"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.ds),
                          Text(
                            movie.overview,
                            style: ThemeFonts.labelSmall.copyWith(
                              color: HexColor("626262"),
                              height: 2.0,
                            ),
                          ),
                        ],
                      )
                      : Center(child: Text("Empty")),
            ),
          ),
        );
      },
    );
  }
}
