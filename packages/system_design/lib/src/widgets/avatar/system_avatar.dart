import 'package:flutter/material.dart';
import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
//import 'package:system_design_package/src/consts/sizes/widgets_size.dart';
import 'package:system_design_package/system_design.dart';

class SystemAvatar extends StatelessWidget {
  final SystemSize? size;
  final String? imageUrl;
  final SystemColors? indicatorColor;
  final bool? withIndicator;

  const SystemAvatar({
    super.key,
    this.size,
    this.imageUrl,
    this.indicatorColor,
    this.withIndicator,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: AvatarSize.converter(size ?? SystemSize.medium),
            height: AvatarSize.converter(size ?? SystemSize.medium),
            decoration: BoxDecoration(
              color: SystemColors.neutral200.value,
              border: Border.all(
                color: SystemColors.white.value,
              ),
              borderRadius: BorderRadius.circular(150),
            ),
            child: SystemIcon(
              SystemIcons.user_line,
              size: size,
              color: SystemColors.neutral600,
            ),
          ),
          if (withIndicator ?? false)
            SystemIndicator(
              color: indicatorColor ?? SystemColors.positive,
              size: size,
            )
        ],
      );
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Container(
          width: AvatarSize.converter(size ?? SystemSize.medium),
          height: AvatarSize.converter(size ?? SystemSize.medium),
          decoration: BoxDecoration(
            color: SystemColors.neutral200.value,
            border: Border.all(
              color: SystemColors.white.value,
            ),
            borderRadius: BorderRadius.circular(150),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (withIndicator ?? false)
          SystemIndicator(
            color: indicatorColor ?? SystemColors.positive,
            size: size,
          )
      ],
    );
  }
}
