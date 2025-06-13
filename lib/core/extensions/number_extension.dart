import '../constants/number_constants.dart';
import '../utils/size_util.dart';

extension NumberX on num {
  double get ds {
    double width = SizeUtil.getScreenWidth;
    double scale = width / NumberConstants.defaultDesignSystemWidth * this;
    double dynamicCalculation = width / scale;

    double result = width / dynamicCalculation;

    return result;
  }
}
