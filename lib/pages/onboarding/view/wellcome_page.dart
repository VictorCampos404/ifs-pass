import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemColors.white.value,
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
                onTap: () {
                  Navigator.pushNamed(context, SystemRoutes.loginPage);
                },
                size: SystemSize.extraLarge,
                expanded: true,
                loading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
