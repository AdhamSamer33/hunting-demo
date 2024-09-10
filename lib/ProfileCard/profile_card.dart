import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent
            ),
            child: Image.asset(
              "assets/images/ProfileImage.png",
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
                color: Colors.white
              ),
              ),
              SizedBox(
                // width: 114.w,
                height: 24.h,
                child: OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.amber, width: 1), // Border color and width
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.only(left: 11.w, right: 11.w)
                    ),
                    child: Text(
                        "Guest Account",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                ),
              ),
            ],
          )
        ],
      ),
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