import 'package:flutter/material.dart';
import 'package:ifs_pass/main_module.dart';
import 'package:ifs_pass/pages/onboarding/view/wellcome_page.dart';
import 'package:system_design_package/system_design.dart';
import 'package:system_package/system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MainModule.getProviders(),
      child: MaterialApp(
        title: 'Ifsp-ass',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: SystemColors.primary.value,
          ),
          useMaterial3: true,
        ),
        routes: MainModule.getRoutes(),
        home: const WellcomePage(),
      ),
    );
  }
}
