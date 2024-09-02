import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  bool back1 = false;
  bool back2 = false;
  bool back3 = false;
  bool back4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            SystemSpacing.x4.value,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SystemIcon(
                    SystemIcons.image_2_fill,
                    size: SystemSize.extraLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x3.value,
                    ),
                    child: const Text(
                      "Escolha seu papel de parede",
                      textAlign: TextAlign.center,
                    ).heading1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x5.value,
                    ),
                    child: Wrap(
                      spacing: SystemSpacing.x4.value,
                      runSpacing: SystemSpacing.x4.value,
                      children: [
                        SystemWallpaper(
                          isChecked: back1,
                          imageUrl: "../assets/images/background.jpg",
                          onChanged: (value) {
                            setState(() {
                              back1 = value;
                            });
                          },
                        ),
                        SystemWallpaper(
                          isChecked: back2,
                          imageUrl: "../assets/images/background.jpg",
                          onChanged: (value) {
                            setState(() {
                              back2 = value;
                            });
                          },
                        ),
                        SystemWallpaper(
                          isChecked: back3,
                          imageUrl: "../assets/images/background.jpg",
                          onChanged: (value) {
                            setState(() {
                              back3 = value;
                            });
                          },
                        ),
                        SystemWallpaper(
                          isChecked: back4,
                          imageUrl: "../assets/images/background.jpg",
                          onChanged: (value) {
                            setState(() {
                              back4 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SystemPrimaryButton(
                text: "Avançar",
                onTap: () {
                  Navigator.pushNamed(context, SystemRoutes.pinPage);
                },
                size: SystemSize.extraLarge,
                enable: true,
                backgroundColor: SystemColors.primary,
                expanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
