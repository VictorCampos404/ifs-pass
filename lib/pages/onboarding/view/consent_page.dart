import 'package:flutter/material.dart';
import 'package:ifs_pass/pages/onboarding/controller/wellcome_controller.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({super.key});

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WellcomeController>(builder: (
      context,
      controller,
      _,
    ) {
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
                      child: Text(
                        controller.haveAccount
                            ? "Permissões"
                            : "Seu Primeiro Acesso",
                        textAlign: TextAlign.center,
                      ).heading1(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SystemSpacing.x5.value,
                      ),
                      child: SystemCheckbox(
                        isChecked:
                            controller.haveAccount || controller.allowTerms,
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        onChanged: (value) {
                          if (controller.haveAccount) return;

                          controller.setAllowTerms(value);
                        },
                      ),
                    ),
                    for (int i = 0; i < controller.permissions.length; i++) ...[
                      Padding(
                        padding: EdgeInsets.only(
                          top: SystemSpacing.x2.value,
                        ),
                        child: SystemCheckbox(
                          isChecked: controller.permissions[i].greated,
                          text: controller.permissions[i].description,
                          onChanged: (value) async {
                            await controller.permissions[i].request();
                            controller.setStatus(Status.success);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
                SystemPrimaryButton(
                  text: "Eu concordo",
                  onTap: () async {

                    if(!controller.haveAccount){
                      final result = await controller.createAccount();

                      if (!context.mounted) return;

                      if (!result.status) {
                        PopUp.showError(
                          context,
                          result.title ?? '',
                          message: result.message,
                        );
                        return;
                      }
                    }

                    Navigator.pushNamed(context, SystemRoutes.home);
                  },
                  size: SystemSize.extraLarge,
                  enable: !controller.needPermission && (controller.haveAccount || controller.allowTerms),
                  backgroundColor: SystemColors.primary,
                  expanded: true,
                  loading: controller.isloading,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
