import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

import 'BottomSheet/View/bottom_sheet.dart';
import 'gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hunting Demo',
      theme: ThemeData(
          primaryColor: MyColors.primaryColor,
          fontFamily: Assets.fonts.sfProDisplay.sfprodisplayregular,
      ),
      home: const MyHomePage(title: 'Hunting Demo'),
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
  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        middle: Text(title),
      ),
      backgroundColor: Color.lerp(MyColors.greenGrad1, MyColors.greenGrad2, 1),
      body: const ProfileBottomSheet(),
    );
  }
}
