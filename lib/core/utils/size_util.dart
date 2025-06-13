import 'package:flutter/widgets.dart';

import '../constants/number_constants.dart';

class SizeUtil {
  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomBarHeight = 0.0;

  static void init(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    _bottomBarHeight = MediaQuery.of(context).viewPadding.bottom;
  }

  // Get current screen width
  static double get getScreenWidth => _screenWidth;

  // Get current screen height
  static double get getScreenHeight => _screenHeight;

  // Get status bar height
  static double get getStatusBarHeight => _statusBarHeight;

  // Get bottom bar height
  static double get getBottomBarHeight => _bottomBarHeight;

  static double dynamicSize(double value) {
    double width = getScreenWidth;
    double scale = width / NumberConstants.defaultDesignSystemWidth * value;
    double dynamicCalculation = width / scale;
    double result = width / dynamicCalculation;
    return result;
  }
}
