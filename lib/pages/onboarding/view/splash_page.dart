// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() async {
      final userName = await SecureLocalData.readData(SecureDataKey.userName);

      if (!context.mounted) return;

      if (userName != null) {
        Navigator.pushReplacementNamed(context, SystemRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, SystemRoutes.wellcomePage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemColors.white.value,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            SystemSpacing.x4.value,
          ),
          child: Center(
            child: Image.asset(
              CustomImages.ifspLogo,
              height: 64,
              width: 64,
            ),
          ),
        ),
      ),
    );
  }
}
