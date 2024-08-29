import 'package:flutter/material.dart';
import 'package:ifs_pass/pages/onboarding/controller/wellcome_controller.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Future.microtask(() {
      final controller = context.read<WellcomeController>();
      controller.resetLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WellcomeController>(
      builder: (
        context,
        controller,
        child,
      ) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: SystemColors.white.value,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SystemSpacing.x4.value,
                    left: SystemSpacing.x4.value,
                    right: SystemSpacing.x4.value,
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
                            child: SystemInput(
                              title: "Matrícula",
                              hint: '0000000',
                              enable: !controller.isloading,
                              controller: controller.userNameCtrl,
                              maxLength: 7,
                              textInputType: TextInputType.number,
                              onChanged: (value) {
                                controller.setStatus(Status.success);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: SystemSpacing.x2.value,
                            ),
                            child: SystemInput(
                              title: "Senha",
                              hint: '••••••••••',
                              enable: !controller.isloading,
                              controller: controller.passwordCtrl,
                              isPassword: true,
                              textInputType: TextInputType.text,
                              onChanged: (value) {
                                controller.setStatus(Status.success);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(
                SystemSpacing.x4.value,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SystemSpacing.x2.value,
                    ),
                    child: SystemPrimaryButton(
                      text: "Esqueci minha senha",
                      onTap: () async {
                        if (!controller.isloading) {
                          final result = await controller.setPassword();

                          if (!context.mounted) return;

                          if (!result.status) {
                            PopUp.showError(
                              context,
                              result.title ?? '',
                              message: result.message,
                            );
                          }
                        }
                      },
                      size: SystemSize.extraLarge,
                      backgroundColor: SystemColors.white,
                      textColor: SystemColors.primary,
                      borderColor: SystemColors.primary,
                      expanded: true,
                    ),
                  ),
                  SystemPrimaryButton(
                    text: "Entrar",
                    onTap: () async {
                      final result = await controller.login();

                      if (!context.mounted) return;

                      if (result.status) {
                        Navigator.pushNamed(context, SystemRoutes.consentPage);
                      } else {
                        PopUp.showError(
                          context,
                          result.title ?? '',
                          message: result.message,
                        );
                      }
                    },
                    size: SystemSize.extraLarge,
                    backgroundColor: SystemColors.primary,
                    enable: controller.isValidLogin,
                    loading: controller.isloading,
                    expanded: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
