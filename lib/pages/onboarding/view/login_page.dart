import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class LoginPage extends StatelessWidget {
  int printing() {
    return 1;
  }

  const LoginPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SystemIcon(
                    SystemIcons.lock_2_line,
                    size: SystemSize.extraLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x3.value,
                    ),
                    child: const Text(
                      "IFSP Account",
                    ).heading1(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x5.value,
                    ),
                    child: const Text(
                      "Utilize sua conta do Moodle para acessar o app",
                    ).body2(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x4.value,
                    ),
                    child: const SystemInput(
                      text: "Matrícula",
                      isPassword: false,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x2.value,
                    ),
                    child: const SystemInput(
                      text: "Senha",
                      isPassword: true,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SystemSpacing.x2.value,
                    ),
                    child: SystemPrimaryButton(
                      text: "Esqueci minha senha",
                      onTap: () {},
                      size: SystemSize.extraLarge,
                      backgroundColor: SystemColors.white,
                      textColor: SystemColors.primary,
                      borderColor: SystemColors.primary,
                      expanded: true,
                    ),
                  ),
                  SystemPrimaryButton(
                    text: "Entrar",
                    onTap: () {
                      Navigator.pushNamed(context, SystemRoutes.consentPage);
                    },
                    size: SystemSize.extraLarge,
                    backgroundColor: SystemColors.primary,
                    expanded: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
