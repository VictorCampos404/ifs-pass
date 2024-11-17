import 'package:flutter/material.dart';
import 'package:ifs_pass/apps/ai/consts/colors.dart';
import 'package:ifs_pass/apps/ai/pages/home/model/message.dart';
import 'package:system_design_package/system_design.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    if (message.isUser ?? true) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          bottom: SystemSpacing.x2.value,
          right: SystemSpacing.x2.value,
          left: SystemSpacing.x4.value,
        ),
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(SystemSpacing.x1.value),
          decoration: BoxDecoration(
            color: AiColors.text,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(SystemSpacing.x0_25.value),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(message.label ?? '').body2(
                    color: AiColors.purple,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SystemSpacing.x2.value,
                    right: SystemSpacing.x0_5.value,
                  ),
                  child: Icon(
                    SystemIcons.user_6_fill.value,
                    color: AiColors.purple,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        bottom: SystemSpacing.x2.value,
        right: SystemSpacing.x4.value,
        left: SystemSpacing.x2.value,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(SystemSpacing.x1.value),
            decoration: BoxDecoration(
              color: AiColors.text,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              SystemIcons.robot_fill.value,
              color: AiColors.purple,
            ),
          ),
          if ((message.label ?? '').isEmpty)
            Container(
              padding: EdgeInsets.all(SystemSpacing.x0_5.value),
              margin: EdgeInsets.only(
                left: SystemSpacing.x1.value,
              ),
              decoration: BoxDecoration(
                color: AiColors.text,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              width: 80,
              height: 40,
              alignment: Alignment.center,
              child: const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 0.5,
                  color: AiColors.purple,
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.all(SystemSpacing.x0_5.value),
              margin: EdgeInsets.only(
                left: SystemSpacing.x1.value,
                top: 4,
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              child: Text(message.label ?? '').body2(
                color: AiColors.purple,
              ),
            )
        ],
      ),
    );
  }
}
