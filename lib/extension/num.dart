import '../config/size_config.dart';

extension SizeExtension on num {
  double get h => SizeConfig.height(toDouble());

  double get w => SizeConfig.width(toDouble());

  double get text => SizeConfig.textSize(toDouble());
}
