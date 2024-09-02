import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class ConfirmPinPage extends StatefulWidget {
  const ConfirmPinPage({super.key});

  @override
  State<ConfirmPinPage> createState() => _ConfirmPinPageState();
}

class _ConfirmPinPageState extends State<ConfirmPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(SystemSpacing.x4.value),
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
                        top: SystemSpacing.x4.value,
                      ),
                      child: const Text(
                        "Confirme seu PIN de acesso",
                        textAlign: TextAlign.center,
                      ).heading1(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SystemSpacing.x5.value),
                      child: SystemPinEntry(
                          length: 6,
                          onChanged: (pin) {
                            print("PIN digitado: $pin");
                          }),
                    )
                  ],
                ),
                SystemPrimaryButton(
                  text: "Avançar",
                  onTap: () {
                    Navigator.pushNamed(context, SystemRoutes.home);
                  },
                  size: SystemSize.extraLarge,
                  enable: true,
                  backgroundColor: SystemColors.primary,
                  expanded: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
