
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../CustomViews/ProfileCard/profile_card.dart';
import '../CustomViews/SettingsTableView/settings_table.dart';
import '../CustomViews/UpgradeButton/upgrade_button.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 800),
        useInheritedMediaQuery: true,
        builder: (context, build) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: MyColors.primaryColor),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ProfileCard(
                          profileImage: Assets.images.profileImage,
                          profileName: 'John Hutchinson',
                          onTapGuest: () {
                            if (kDebugMode) {
                              print("Tapped Guest");
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: UpgradeButton(
                          price: '40.000',
                          features: const [
                            "Manage your hunting and fishing licenses",
                            "Hunt or fish on public grounds with the app",
                            "Get game reserve tickets for private hunting grounds (Soon)"
                          ],
                          onTapUpgrade: () {
                            if (kDebugMode) {
                              print("Tapped Upgrade");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: ScreenUtil.defaultSize.height / 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        MyColors.greenGrad1,
                        MyColors.greenGrad2,
                      ],
                    ),
                  ),
                  child: SettingsTable(
                    settings: {
                      "Hunting Licenses": () {
                        if (kDebugMode) {
                          print("License");
                        }
                      },
                      "Hunting permits": () {},
                      "Manage your subscription": () {},
                      "Terms and conditions": () {},
                      "Log out": () {}
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

}
