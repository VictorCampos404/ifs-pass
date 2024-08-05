import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

class Pinpage extends StatefulWidget {
  const Pinpage({super.key});

  @override
  State<Pinpage> createState() => _PinpageState();
}

class _PinpageState extends State<Pinpage> {
  int printing() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
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
                        left: SystemSpacing.x4.value,
                        right: SystemSpacing.x4.value,
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
                Container(
                  padding: EdgeInsets.only(
                    left: SystemSpacing.x4.value,
                    right: SystemSpacing.x4.value,
                    bottom: SystemSpacing.x9.value,
                  ),
                  child: SystemPrimaryButton(
                    text: "Avançar",
                    onTap: printing,
                    size: SystemSize.extraLarge,
                    enable: true,
                    backgroundColor: SystemColors.primary,
                    expanded: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
