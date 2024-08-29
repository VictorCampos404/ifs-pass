import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:system_design_package/system_design.dart';

class PopUp {
  PopUp._();

  static void showNotification(
    BuildContext context,
    String title, {
    String? message,
  }) {
    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(
        SystemIcons.notification_2_fill.value,
        color: SystemColors.warning.value,
      ),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: SystemColors.neutral200.value,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        )
      ],
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Container(
        child: Text(
          title,
        ).body1(),
      ),
      messageText: message == null
          ? const SizedBox()
          : Container(
              child: Text(message).body2(),
            ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showError(
    BuildContext context,
    String title, {
    String? message,
  }) {
    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(
        SystemIcons.error_warning_fill.value,
        color: SystemColors.negative.value,
      ),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: SystemColors.neutral200.value,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        )
      ],
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Container(
        child: Text(
          title,
        ).body1(),
      ),
      messageText: message == null
          ? const SizedBox()
          : Container(
              child: Text(message).body2(),
            ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void showSuccess(
    BuildContext context,
    String title, {
    String? message,
  }) {
    Flushbar(
      duration: const Duration(seconds: 4),
      icon: Icon(
        SystemIcons.checkbox_circle_fill.value,
        color: SystemColors.positive.value,
      ),
      boxShadows: <BoxShadow>[
        BoxShadow(
          color: SystemColors.positive.value,
          blurRadius: 7.0,
          offset: const Offset(0.0, 0.75),
        )
      ],
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      titleText: Container(
        child: Text(
          title,
        ).body1(),
      ),
      messageText: message == null
          ? const SizedBox()
          : Container(
              child: Text(message).body2(),
            ),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
