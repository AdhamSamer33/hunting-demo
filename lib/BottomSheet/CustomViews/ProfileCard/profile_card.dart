import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';
import 'package:hunting_demo/gen/colors.gen.dart';


class ProfileCard extends StatefulWidget {
  final AssetGenImage profileImage;
  final String profileName;
  final Function onTapGuest;
  const ProfileCard({super.key, required this.profileImage, required this.profileName, required this.onTapGuest});

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
            widget.profileImage.keyName,
            width: 45.w,
            height: 45.h,
            centerSlice: const Rect.fromLTRB(20, 0, 20, 0),
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
              widget.profileName,
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
  }

  void onPressed() {
    setState(() => widget.onTapGuest.call());
    }

}