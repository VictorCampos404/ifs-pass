import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class WellcomePage extends StatelessWidget {
  int printing() {
    return 1;
  }

  const WellcomePage({super.key});

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
                  Image.asset(
                    CustomImages.ifspLogo,
                    height: 32,
                    width: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x4.value,
                    ),
                    child: const Text(
                      "Bem Vindo(a)",
                    ).heading1(),
                  ),
                ],
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                textAlign: TextAlign.center,
              ).body2(),
              SystemPrimaryButton(
                text: "Começar",
                onTap: printing,
                size: SystemSize.extraLarge,
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
