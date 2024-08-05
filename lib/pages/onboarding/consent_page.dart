import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({super.key});

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  int printing() {
    return 1;
  }

  bool terms = false;
  bool location = false;
  bool camera = false;

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
                      SystemIcons.information_line,
                      size: SystemSize.extraLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x4.value,
                    ),
                    child: const Text(
                      "Seu Primeiro Acesso",
                    ).heading1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x5.value,
                      left: SystemSpacing.x4.value,
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
                      top: SystemSpacing.x4.value,
                      left: SystemSpacing.x4.value,
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
                      top: SystemSpacing.x4.value,
                      left: SystemSpacing.x4.value,
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
              Container(
                padding: EdgeInsets.only(
                  left: SystemSpacing.x4.value,
                  right: SystemSpacing.x4.value,
                  bottom: SystemSpacing.x9.value,
                ),
                child: SystemPrimaryButton(
                  text: "Eu-Concordo",
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
