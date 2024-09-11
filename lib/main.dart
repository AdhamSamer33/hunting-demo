import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/ProfileCard/profile_card.dart';
import 'package:hunting_demo/UpgradeButton/upgrade_button.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

import 'gen/assets.gen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 800),
      builder: (context, build) {
       return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
            fontFamily: Assets.fonts.sfProDisplay.sfprodisplayregular,
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
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
      body: Container(
        decoration: const BoxDecoration(
          color: MyColors.primaryColor
        ),
        child: const Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ProfileCard(),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: UpgradeButton(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
