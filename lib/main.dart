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

  void _incrementCounter() {

  }

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
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Display-1',
                  ).display1(),
                  const Text(
                    'Display-2',
                  ).display2(),
                  const Text(
                    'Display-3',
                  ).display3(),
                  const Text(
                    'Heading-1',
                  ).heading1(),
                  const Text(
                    'Heading-2',
                  ).heading2(fontWeight: SystemFontWeight.semiBold),
                  const Text(
                    'Heading-2',
                  ).heading2(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Heading-2',
                  ).heading2(), //SystemFontWeight.regular por padrão
                  const Text(
                    'Heading-3',
                  ).heading3(fontWeight: SystemFontWeight.semiBold),
                  const Text(
                    'Heading-3',
                  ).heading3(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Heading-3',
                  ).heading3(), //SystemFontWeight.regular por padrão
                  const Text(
                    'Heading-4',
                  ).heading4(fontWeight: SystemFontWeight.semiBold),
                  const Text(
                    'Heading-4',
                  ).heading4(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Heading-4',
                  ).heading4(), //SystemFontWeight.regular por padrão
                  const Text(
                    'Body-1',
                  ).body1(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Body-1',
                  ).body1(fontWeight: SystemFontWeight.medium, decoration: SystemTextDecoration.underline),
                  const Text(
                    'Body-1',
                  ).body1(),
                  const Text(
                    'Body-2',
                  ).body2(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Body-2',
                  ).body2(fontWeight: SystemFontWeight.medium, decoration: SystemTextDecoration.underline),
                  const Text(
                    'Body-2',
                  ).body2(),//SystemFontWeight.regular por padrão
                  const Text(
                    'Caption',
                  ).caption(fontWeight: SystemFontWeight.semiBold),
                  const Text(
                    'Caption',
                  ).caption(fontWeight: SystemFontWeight.medium),
                  const Text(
                    'Caption',
                  ).caption(fontWeight: SystemFontWeight.medium, decoration: SystemTextDecoration.underline),
                  const Text(
                    'Caption',
                  ).caption(),//SystemFontWeight.regular por padrão
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(SystemIcons.a_b.value),
      ),
    );
  }
}
