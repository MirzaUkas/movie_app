import '../constants/number_constants.dart';
import '../utils/size_util.dart';

extension NumberX on num {
  double get ds {
    double width =
        SizeUtil.getScreenWidth == 0.0
            ? NumberConstants.defaultDesignSystemWidth
            : SizeUtil.getScreenWidth;
    double scale = width / NumberConstants.defaultDesignSystemWidth * this;
    double dynamicCalculation = width / scale;

    double result = width / dynamicCalculation;

    return result;
  }
}
