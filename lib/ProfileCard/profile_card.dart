import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';
import 'package:hunting_demo/gen/colors.gen.dart';

// import '../res/assets_res.dart';
// import 'colors';


class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          child: Image.asset(
            Assets.images.profileImage.keyName,
            width: 45.w,
            height: 45.h,
            centerSlice: const Rect.fromLTRB((20), 0, (20), 0),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Hutchinson",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            ),
            SizedBox(
              // width: 114.w,
              height: 24.h,
              child: OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: MyColors.secondaryColor, width: 1), // Border color and width
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.only(left: 11.w, right: 11.w)
                  ),
                  child: Text(
                      "Guest Account",
                    maxLines: 1,
                    style: TextStyle(
                        color: MyColors.secondaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
              ),
            ),
          ],
        )
      ],
    );
    // TODO: implement build
  }

  void onPressed() {
    setState(() {
      if (kDebugMode) {
        print("Pressed");
      }}
    );
    }

}