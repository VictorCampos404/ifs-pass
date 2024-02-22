import 'package:flutter/widgets.dart';
import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemIndicator extends StatelessWidget {
  final SystemColors? color;
  final SystemSize? size;
  const SystemIndicator({
    super.key,
    this.color,
    this.size,
    //Propriedades
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: IndicatorSize.converter(size ?? SystemSize.medium),
      width: IndicatorSize.converter(size ?? SystemSize.medium),
      decoration: BoxDecoration(
          color: color?.value ?? SystemColors.primary.value,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
    );
  }
}
