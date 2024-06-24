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
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 72,
                ),
              ),
              Container(
                child: Image.asset(
                  CustomImages.ifspLogo,
                ),
                height: 32,
                width: 32,
                color: SystemColors.white.value,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32,
                ),
              ),
              Text(
                "Bem Vindo(a)",
              ).heading1(),
              Padding(
                padding: EdgeInsets.only(
                  top: 185,
                ),
              ),
              SizedBox(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
                height: 120,
                width: 326,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 246,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 32,
                  right: 32,
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
      ),
    );
  }
}
