import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

class UpgradeButton extends StatefulWidget {
  final String price;
  final List<String> features;
  final Function onTapUpgrade;
  const UpgradeButton({super.key, required this.price, required this.features, required this.onTapUpgrade});

  @override
  State<UpgradeButton> createState() => _UpgradeButtonState();
}
String generateFeatures(List<String> features) {
  List<String> modifiedFeatures = [];
  for (var feature in features) {
    modifiedFeatures.add("- $feature\n");
  }
  return modifiedFeatures.join();
}
class _UpgradeButtonState extends State<UpgradeButton> {
  @override
  Widget build(BuildContext context) {
  List<String> features = widget.features;
    return SizedBox(
        width: 353.w,
        height: 193.h,
        child: GestureDetector(
          onTap: () => widget.onTapUpgrade.call(),
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
                      padding: const EdgeInsets.only(left: 18.5, top: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${widget.price} ",
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

                          SizedBox(
                            height: 120.h,
                            child: SingleChildScrollView(
                              child: Text(
                                  generateFeatures(features),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
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
