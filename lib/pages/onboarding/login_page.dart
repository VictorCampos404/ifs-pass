import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class LoginPage extends StatelessWidget {
  int printing() {
    return 1;
  }

  const LoginPage({super.key});

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
                      SystemIcons.lock_2_line,
                      size: SystemSize.extraLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: SystemSpacing.x4.value,
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
                    ),
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
              Container(
                padding: EdgeInsets.only(
                  top: SystemSpacing.x8.value,
                  left: SystemSpacing.x4.value,
                  right: SystemSpacing.x4.value,
                ),
                child: SystemPrimaryButton(
                  //AQUI ESTA QUEBRANDO POR CAUSA DO ESPACO
                  text: "EsqueciMinhaSenha",
                  onTap: printing,
                  size: SystemSize.extraLarge,
                  backgroundColor: SystemColors.white,
                  textColor: SystemColors.primary,
                  expanded: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: SystemSpacing.x4.value,
                  right: SystemSpacing.x4.value,
                  bottom: SystemSpacing.x9.value,
                ),
                child: SystemPrimaryButton(
                  text: "Entrar",
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
