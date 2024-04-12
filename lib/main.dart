import 'package:flutter/material.dart';
import 'package:system_design_package/system_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool locked = true;

  void changeLocked() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              CustomImages.background,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GlassContainer(
                    duration: const Duration(milliseconds: 1000),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        if (1 != 2) ...[
                          Padding(
                            padding:
                                EdgeInsets.only(right: SystemSpacing.x2.value),
                            child: const SystemAvatar(
                              size: SystemSize.medium,
                              imageUrl:
                                  'https://img.freepik.com/fotos-gratis/close-no-homem-sorrindo-na-natureza_23-2150771075.jpg',
                            ),
                          ),
                          const Text(
                            'Bem-vindo Victor!',
                          ).heading3(
                              color: SystemColors.white,
                              fontWeight: SystemFontWeight.semiBold),
                        ],
                      ],
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(150.0),
                    child: const SystemAvatar(
                      size: SystemSize.medium,
                      imageUrl:
                          'https://img.freepik.com/fotos-gratis/close-no-homem-sorrindo-na-natureza_23-2150771075.jpg',
                      indicatorColor: SystemColors.neutral400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
