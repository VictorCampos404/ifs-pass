import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({super.key});

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  bool terms = false;
  bool location = false;
  bool camera = false;

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
                    SystemIcons.information_line,
                    size: SystemSize.extraLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x3.value,
                    ),
                    child: const Text(
                      "Seu Primeiro Acesso",
                      textAlign: TextAlign.center,
                    ).heading1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x5.value,
                    ),
                    child: SystemCheckbox(
                      isChecked: terms,
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      onChanged: (value) {
                        setState(() {
                          terms = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x2.value,
                    ),
                    child: SystemCheckbox(
                      isChecked: location,
                      text: "Acesso a localização do dispositivo",
                      onChanged: (value) {
                        setState(() {
                          location = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x2.value,
                    ),
                    child: SystemCheckbox(
                      isChecked: camera,
                      text: "Acesso a câmera do dispositivo",
                      onChanged: (value) {
                        setState(() {
                          camera = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SystemPrimaryButton(
                text: "Eu concordo",
                onTap: () {
                  Navigator.pushNamed(context, SystemRoutes.wallpaperPage);
                },
                size: SystemSize.extraLarge,
                enable: terms && location && camera,
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
