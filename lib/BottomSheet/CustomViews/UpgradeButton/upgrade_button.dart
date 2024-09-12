import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

class UpgradeButton extends StatelessWidget {
  final String price;
  final String currency;
  final String cycle;
  final List<String> features;
  final Function onTapUpgrade;

  const UpgradeButton({
    super.key,
    required this.price,
    required this.currency,
    required this.cycle,
    required this.features,
    required this.onTapUpgrade,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 353.w,
      height: 193.h,
      child: GestureDetector(
        onTap: () => onTapUpgrade.call(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.yellowGrad1, MyColors.yellowGrad2],
            ),
          ),
          child: Stack(
            children: [
              _buildUpgradeTitle(),
              _buildArrow(),
              _buildFeaturesContainer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesContainer() {
    return Positioned(
      right: 5,
      top: 5,
      bottom: 5,
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
              _buildPriceText(),
              Padding(
                padding: EdgeInsets.only(top:16.h),
                child: SizedBox(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildPriceText() {
    return Row(
              children: [
                Text(
                  "$price ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "$currency / $cycle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            );
  }

  Widget _buildArrow() {
    return Positioned(
      bottom: 10.0,
      left: 12.0,
      child: Image.asset(Assets.images.arrow.keyName),
    );
  }

  Widget _buildUpgradeTitle() {
    return Positioned(
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
    );
  }
}

String generateFeatures(List<String> features) {
  List<String> modifiedFeatures = [];
  for (var feature in features) {
    modifiedFeatures.add("- $feature\n");
  }
  return modifiedFeatures.join();
}
