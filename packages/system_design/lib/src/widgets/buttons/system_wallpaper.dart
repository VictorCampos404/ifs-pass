import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class SystemWallpaper extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  final String imageUrl;
  const SystemWallpaper({
    required this.isChecked,
    required this.onChanged,
    required this.imageUrl,
    super.key,
  });

  @override
  State<SystemWallpaper> createState() => _SystemWallpaperState();
}

class _SystemWallpaperState extends State<SystemWallpaper> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.isChecked),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SystemCheckbox(
            isChecked: widget.isChecked,
            onChanged: widget.onChanged,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: SystemSpacing.x1.value,
            ),
            child: Container(
              height: 125,
              width: 111,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SystemSpacing.x1.value,
                ),
                image: DecorationImage(
                  image: AssetImage(CustomImages.background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
