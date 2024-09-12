import 'package:flutter/material.dart';
import 'package:system_package/system.dart';
import 'package:system_design_package/system_design.dart';
import 'package:ifs_pass/apps/ai/pages/home/controller/home_controller.dart';

class AiHomePage extends StatelessWidget {
  const AiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AiHomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text('Ai').heading3(
              color: SystemColors.white,
            ),
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: Text(
              '${controller.count}',
              style: const TextStyle(fontSize: 24),
            ).display2(
              color: SystemColors.white,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            child: Icon(
              SystemIcons.add_fill.value,
              color: SystemColors.white.value,
            ),
            onPressed: () {
              controller.addOne();
            },
          ),
        );
      },
    );
  }
}
