import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTable extends StatefulWidget {
  const SettingsTable({super.key});

  @override
  State<SettingsTable> createState() => _SettingsTableState();
}

class _SettingsTableState extends State<SettingsTable> {
  List<String> data = ["Hunting Licenses","Hunting permits","Manage your subscription","Terms and conditions","Log out"];
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: 347.h,
     child: ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
       separatorBuilder: (BuildContext context, int index) {
         return const Divider();
       },
       itemBuilder: (context, index) {
         // data.map((setting) =>
             return GestureDetector(
               onTap: () {
                 if (kDebugMode) {
                   print("TT");
                 }

               },
               child: CupertinoListTile(
                 title: Text(
                   data[index],
                   style: TextStyle(
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w500,
                       color: CupertinoColors.white
                   ),
                 ),
                 trailing: const CupertinoListTileChevron(),
               ),
             );
         // )
         //     .cast<Widget>()
         //     .toList(growable: true);
       },
       itemCount: 5,
     ),
   );
  }
}