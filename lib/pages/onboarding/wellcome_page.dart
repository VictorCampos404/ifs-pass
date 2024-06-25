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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: SystemSpacing.x9.value,
              ),
              color: SystemColors.white.value,
              child: Column(
                children: [
                  Image.asset(
                    CustomImages.ifspLogo,
                    height: 32,
                    width: 32,
                  ),
                  // DAQUI PARA BAIXO TROCAR PELO SYSTEM SPACING
                  //CONST VAI QUEBRAR

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
            ),
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 72,
              ),
              child: SystemPrimaryButton(
                text: "Começar",
                onTap: printing,
                size: SystemSize.extraLarge,
                backgroundColor: SystemColors.primary,
                expanded: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
