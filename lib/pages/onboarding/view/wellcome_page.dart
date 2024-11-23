import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                      "Bem-vindo(a) ao IFSP App! 🎓",
                      textAlign: TextAlign.center,
                    ).heading1(),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: const Text(
                    "Seu espaço digital para facilitar a rotina acadêmica e estar conectado(a) ao Instituto Federal de São Paulo!\n\nAcompanhe suas aulas, notas, eventos e muito mais, de forma simples e prática.",
                    textAlign: TextAlign.center,
                  ).body2(),
                ),
              ),
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
