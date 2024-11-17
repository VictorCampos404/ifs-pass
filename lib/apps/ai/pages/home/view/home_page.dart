import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/ai/consts/colors.dart';
import 'package:ifs_pass/apps/ai/pages/home/view/widgets/chat_input.dart';
import 'package:ifs_pass/apps/ai/pages/home/view/widgets/message_card.dart';
import 'package:system_package/system.dart';
import 'package:system_design_package/system_design.dart';
import 'package:ifs_pass/apps/ai/pages/home/controller/home_controller.dart';

class AiHomePage extends StatelessWidget {
  const AiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AiHomeController>(builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AiColors.background,
            appBar: AppBar(
              // leading: Align(
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     Images.stars,
              //     width: 24,
              //     height: 24,
              //   ),
              // ),
              title: const Text('IFSP AI').heading3(
                color: AiColors.purple,
              ),
              centerTitle: false,
              leadingWidth: 48,
              titleSpacing: 0,
              backgroundColor: AiColors.background,
              elevation: 0,
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // if (controller.messages.isEmpty)
                //   Align(
                //     alignment: Alignment.center,
                //     child: Image.asset(
                //       Images.stars,
                //       width: 112,
                //       height: 112,
                //     ),
                //   )
                // else
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: SystemSpacing.x4.value,
                    bottom: SystemSpacing.x9.value + SystemSpacing.x4.value,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < controller.messages.length; i++)
                          MessageCard(
                            message: controller.messages[i],
                          ),
                      ],
                    ),
                  ),
                ),
                const ChatInput(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
