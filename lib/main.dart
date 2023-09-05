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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SystemIcon(SystemIcons.home_6_fill, size: SystemSize.large),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SystemIconButton(
                      size: SystemSize.medium,
                      icon: SystemIcons.picture_in_picture_exit_fill,

                      //enable: false,
                      //loading: true,
                      onTap: () {
                        print("oi");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SystemPrimaryButton(
                      text: "Button",
                      size: SystemSize.large,
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SystemPrimaryButton(
                      text: "Button",
                      onTap: () {},
                    ),
                  ),
                  SystemPrimaryButton(
                    text: "Button",
                    size: SystemSize.small,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
