import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  int printing() {
    return 1;
  }

  bool back1 = false;
  bool back2 = false;
  bool back3 = false;
  bool back4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x9.value,
                    ),
                    child: const SystemIcon(
                      SystemIcons.image_2_fill,
                      size: SystemSize.extraLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x4.value,
                    ),
                    child: const Text(
                      "Escolha seu papel de parede",
                      textAlign: TextAlign.center,
                    ).heading1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x5.value,
                      left: SystemSpacing.x4.value,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: SystemSpacing.x4.value,
                              ),
                              child: SystemWallpaper(
                                isChecked: back1,
                                imageUrl: "../assets/images/background.jpg",
                                onChanged: (value) {
                                  setState(() {
                                    back1 = value;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: SystemSpacing.x5.value,
                              ),
                              child: SystemWallpaper(
                                isChecked: back2,
                                imageUrl: "../assets/images/background.jpg",
                                onChanged: (value) {
                                  setState(() {
                                    back2 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: SystemSpacing.x4.value,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: SystemSpacing.x4.value,
                                ),
                                child: SystemWallpaper(
                                  isChecked: back3,
                                  imageUrl: "../assets/images/background.jpg",
                                  onChanged: (value) {
                                    setState(() {
                                      back3 = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: SystemSpacing.x5.value,
                                ),
                                child: SystemWallpaper(
                                  isChecked: back4,
                                  imageUrl: "../assets/images/background.jpg",
                                  onChanged: (value) {
                                    setState(() {
                                      back4 = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: SystemSpacing.x4.value,
                  right: SystemSpacing.x4.value,
                  bottom: SystemSpacing.x9.value,
                ),
                child: SystemPrimaryButton(
                  text: "Avançar",
                  onTap: printing,
                  size: SystemSize.extraLarge,
                  enable: true,
                  backgroundColor: SystemColors.primary,
                  expanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
