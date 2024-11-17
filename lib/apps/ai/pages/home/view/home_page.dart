import 'package:flutter/material.dart';
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
            backgroundColor: SystemColors.white.value,
            appBar: AppBar(
              foregroundColor: SystemColors.white.value,
              title: const Text('IFSP AI').heading3(
                color: SystemColors.white.value
              ),
              centerTitle: false,
              leadingWidth: 48,
              titleSpacing: 0,
              backgroundColor: SystemColors.primary.value,
              elevation: 0,
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(
                    top: SystemSpacing.x4.value,
                    bottom: SystemSpacing.x9.value + SystemSpacing.x4.value,
                  ),
                  child: controller.messages.isEmpty
                  ? Center(
                    child: Icon(
                      SystemIcons.sparkling_fill.value,
                      color: SystemColors.primary.value.withOpacity(0.5),
                      size: 128,
                    ),
                  )
                  : SingleChildScrollView(
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
