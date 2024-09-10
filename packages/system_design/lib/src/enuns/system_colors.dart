import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/colors/custom_colors.dart';

enum SystemColors {
  primary(value: CustomColors.primary),
  neutral50(value: CustomColors.neutral50),
  neutral200(value: CustomColors.neutral200),
  neutral300(value: CustomColors.neutral300),
  neutral400(value: CustomColors.neutral400),
  neutral500(value: CustomColors.neutral500),
  neutral600(value: CustomColors.neutral600),
  neutral800(value: CustomColors.neutral800),
  white(value: CustomColors.white),
  info(value: CustomColors.info),
  positive(value: CustomColors.positive),
  warning(value: CustomColors.warning),
  negative(value: CustomColors.negative),
  transparent(value: CustomColors.transparent);

  final Color value;
  const SystemColors({required this.value});
}
