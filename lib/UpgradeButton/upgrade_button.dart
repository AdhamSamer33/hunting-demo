import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

class UpgradeButton extends StatefulWidget {
  const UpgradeButton({super.key});

  @override
  State<UpgradeButton> createState() => _UpgradeButtonState();
}
String generateFeatures(List<String> features) {
  List<String> modifiedFeatures = [];
  features.forEach((feature) {
    modifiedFeatures.add("- ${feature}\n");
  });
  return modifiedFeatures.join();
}
class _UpgradeButtonState extends State<UpgradeButton> {
  List<String> features = ["Manage your hunting and fishing licenses", "Hunt or fish on public grounds with the app", "Get game reserve tickets for private hunting grounds (Soon)"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 353.w,
        height: 193.h,
        child: GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print("Upgrade Pressed !");
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [MyColors.yellowGrad1, MyColors.yellowGrad2],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10.0,
                  left: 12.0,
                  child: SizedBox(
                    width: 103.w,
                    child: Text(
                      'Upgrade To Pro',
                      style: TextStyle(
                        color: MyColors.textColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 12.0,
                  child: Image.asset(Assets.images.arrow.keyName),
                ),
                Positioned(
                  right: 16,
                  top: 10,
                  bottom: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    width: 213.w,
                    height: 183.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.5, top: 14),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                "40.000 ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "AZN / year",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Text(
                              generateFeatures(features),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
