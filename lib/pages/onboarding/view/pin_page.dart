import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
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
                      SystemIcons.lock_2_line,
                      size: SystemSize.extraLarge,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: SystemSpacing.x3.value,
                      ),
                      child: const Text(
                        "Defina seu PIN de acesso",
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
                    Navigator.pushNamed(context, SystemRoutes.confirmPinPage);
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
