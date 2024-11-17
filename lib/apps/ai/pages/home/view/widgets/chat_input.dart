import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/ai/consts/colors.dart';
import 'package:ifs_pass/apps/ai/pages/home/controller/home_controller.dart';
import 'package:ifs_pass/apps/ai/pages/home/view/widgets/button_card.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  late FocusNode inputFocus;

  @override
  void initState() {
    inputFocus = FocusNode()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AiHomeController>(builder: (context, controller, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (inputFocus.hasFocus)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < controller.areas.length; i++)
                    InkWell(
                      onTap: () {
                        controller.setInputCtrlText(
                          controller.areas[i],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: i == 0
                              ? SystemSpacing.x2.value
                              : SystemSpacing.x1.value,
                        ),
                        padding: EdgeInsets.all(
                          SystemSpacing.x1.value,
                        ),
                        decoration: BoxDecoration(
                          color: AiColors.text,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(controller.areas[i]).body1(
                          fontWeight: SystemFontWeight.medium,
                          color: AiColors.purple,
                        ),
                      ),
                    ),
                  SizedBox(
                    width: SystemSpacing.x2.value,
                  )
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.all(SystemSpacing.x2.value),
            child: ButtonCard(
              height: ButtonCardHeight.middle,
              background: AiColors.transparent,
              top: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SystemInput(
                          focusNode: inputFocus,
                          hint: 'Digite uma área de interesse...',
                          fillColor: AiColors.purple.withOpacity(0.5),
                          controller: controller.inputCtrl,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          onChanged: (value) {
                            controller.updateStatus();
                          },
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.sendButtonEnable) {
                        inputFocus.unfocus();
                        controller.sendMessage();
                      }
                    },
                    icon: Icon(
                      SystemIcons.send_plane_2_fill.value,
                      color: controller.sendButtonEnable
                          ? AiColors.purple
                          : AiColors.purple.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
