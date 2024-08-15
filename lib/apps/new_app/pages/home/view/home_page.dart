import 'package:flutter/material.dart';
import 'package:system_package/system.dart';
import 'package:system_design_package/system_design.dart';
import 'package:ifs_pass/apps/new_app/pages/home/controller/home_controller.dart';

class NewAppHomePage extends StatelessWidget {
  const NewAppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAppHomeController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: Center(
            child: Text(
              '${controller.count}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          floatingActionButton: FloatingActionButton(
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