import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../CustomViews/ProfileCard/profile_card.dart';
import '../CustomViews/SettingsTableView/settings_table.dart';
import '../CustomViews/UpgradeButton/upgrade_button.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  double _listViewHeight = 0.0;

  // Callback function to update the height from the ListView widget
  void _updateListViewHeight(double height) {
    setState(() {
      _listViewHeight = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 800),
        useInheritedMediaQuery: true,
        builder: (context, build) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                _buildUserInfo(context),
                _buildSettingList(context),
              ],
            ),
          );
        });
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: MyColors.primaryColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProfileCard(
              profileImage: Assets.images.profileImage,
              profileName: 'John Hutchinson',
              onTapGuest: () {
                log("Tapped Guest");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UpgradeButton(
              price: '40.000',
              currency: 'AZN',
              cycle: 'Year',
              features: const [
                "Manage your hunting and fishing licenses",
                "Hunt or fish on public grounds with the app",
                "Get game reserve tickets for private hunting grounds (Soon)"
              ],
              onTapUpgrade: () {
                log("Tapped Upgrade");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingList(BuildContext context) {
    return Container(
      // height: _listViewHeight == 0 ? null : _listViewHeight,
      height: ScreenUtil.defaultSize.height,
      width: MediaQuery.sizeOf(context).width,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: _listViewHeight == 0
        //     ? const SizedBox.shrink()
        //     : SettingsTable(
        child: SettingsTable(
          settings: {
            "Hunting Licenses": () {
              log("License");
            },
            "Hunting permits": () {
              log("Hunting permits");
            },
            "Manage your subscription": () {
              log("Manage your subscription");
            },
            "Terms and conditions": () {
              log("Terms and conditions");
            },
            "Log out": () {
              log("Log out");
            }
          },
          onHeightCalculated: (height) {
            _updateListViewHeight(height);
          },
        ),
      ),
    );
  }
}
