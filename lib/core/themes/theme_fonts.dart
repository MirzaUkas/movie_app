import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/number_extension.dart';

class ThemeFonts {
  ThemeFonts._();

  ///////////////////////////// FONT ASSETS //////////////////////////////

  /// Font Family
  static String roboto = 'Roboto';

  /// Main Font Sizes
  static TextStyle fs8 = TextStyle(fontSize: 8.ds, fontFamily: roboto);
  static TextStyle fs10 = TextStyle(fontSize: 10.ds, fontFamily: roboto);
  static TextStyle fs11 = TextStyle(fontSize: 11.ds, fontFamily: roboto);
  static TextStyle fs12 = TextStyle(fontSize: 12.ds, fontFamily: roboto);
  static TextStyle fs14 = TextStyle(fontSize: 14.ds, fontFamily: roboto);
  static TextStyle fs16 = TextStyle(fontSize: 16.ds, fontFamily: roboto);
  static TextStyle fs18 = TextStyle(fontSize: 18.ds, fontFamily: roboto);
  static TextStyle fs19 = TextStyle(fontSize: 19.ds, fontFamily: roboto);
  static TextStyle fs20 = TextStyle(fontSize: 20.ds, fontFamily: roboto);
  static TextStyle fs22 = TextStyle(fontSize: 22.ds, fontFamily: roboto);
  static TextStyle fs24 = TextStyle(fontSize: 24.ds, fontFamily: roboto);
  static TextStyle fs25 = TextStyle(fontSize: 25.ds, fontFamily: roboto);
  static TextStyle fs28 = TextStyle(fontSize: 28.ds, fontFamily: roboto);
  static TextStyle fs32 = TextStyle(fontSize: 32.ds, fontFamily: roboto);
  static TextStyle fs36 = TextStyle(fontSize: 36.ds, fontFamily: roboto);
  static TextStyle fs40 = TextStyle(fontSize: 40.ds, fontFamily: roboto);
  static TextStyle fs48 = TextStyle(fontSize: 48.ds, fontFamily: roboto);
  static TextStyle fs56 = TextStyle(fontSize: 56.ds, fontFamily: roboto);
  static TextStyle fs64 = TextStyle(fontSize: 64.ds, fontFamily: roboto);
  static TextStyle fs72 = TextStyle(fontSize: 72.ds, fontFamily: roboto);
  static TextStyle fs80 = TextStyle(fontSize: 80.ds, fontFamily: roboto);
  static TextStyle fs88 = TextStyle(fontSize: 88.ds, fontFamily: roboto);
  static TextStyle fs96 = TextStyle(fontSize: 96.ds, fontFamily: roboto);

  /// FontWeight
  static TextStyle extraBold = const TextStyle(fontWeight: FontWeight.w800);
  static TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle semiBold = const TextStyle(fontWeight: FontWeight.w600);
  static TextStyle medium = const TextStyle(fontWeight: FontWeight.w500);
  static TextStyle regular = const TextStyle(fontWeight: FontWeight.w400);
  static TextStyle light = const TextStyle(fontWeight: FontWeight.w300);

  /// FontStyle
  static TextStyle italic = const TextStyle(fontStyle: FontStyle.italic);

  ///////////////////////////// FONT THEMES //////////////////////////////

  /// Font Sizes Title Heading
  static TextStyle h1 = ThemeFonts.fs40.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2 = ThemeFonts.fs32.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle h3 = ThemeFonts.fs24.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle h4 = ThemeFonts.fs20.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle h5 = ThemeFonts.fs18.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle h6 = ThemeFonts.fs16.copyWith(
    fontWeight: FontWeight.bold,
  );

  /// Font Sizes Title
  static TextStyle titleXLarge = ThemeFonts.fs36.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLarge = ThemeFonts.fs24.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleMedium = ThemeFonts.fs18.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleSmall = ThemeFonts.fs16.copyWith(
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleXSmall = ThemeFonts.fs12.copyWith(
    fontWeight: FontWeight.bold,
  );

  /// Font Sizes Semibold
  static TextStyle semiBoldXLarge = ThemeFonts.fs24.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBoldLarge = ThemeFonts.fs18.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBoldMedium = ThemeFonts.fs16.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBoldSmall = ThemeFonts.fs14.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBoldXSmall = ThemeFonts.fs12.copyWith(
    fontWeight: FontWeight.w600,
  );

  /// Font Sizes Sub Heading
  // static TextStyle subHeadingMedium = ThemeFonts.fs16.copyWith(
  //   fontWeight: FontWeight.w500,
  // );
  // static TextStyle subHeadingSmall = ThemeFonts.fs14.copyWith(
  //   fontWeight: FontWeight.w500,
  // );
  // static TextStyle subHeadingXSmall = ThemeFonts.fs12.copyWith(
  //   fontWeight: FontWeight.w500,
  // );


  /// Font Sizes Label
  static TextStyle labelXLarge = ThemeFonts.fs24.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelLarge = ThemeFonts.fs18.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelMedium = ThemeFonts.fs16.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelSmall = ThemeFonts.fs14.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelXSmall = ThemeFonts.fs12.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle label2XSmall = ThemeFonts.fs11.copyWith(
    fontWeight: FontWeight.w500,
  );

  /// Font Sizes Body
  static TextStyle bodyXLarge = ThemeFonts.fs24.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyLarge = ThemeFonts.fs18.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyMedium = ThemeFonts.fs16.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodySmall = ThemeFonts.fs14.copyWith(
    fontWeight: FontWeight.w400,
  );
  static TextStyle bodyXSmall = ThemeFonts.fs12.copyWith(
    fontWeight: FontWeight.w400,
  );
}
