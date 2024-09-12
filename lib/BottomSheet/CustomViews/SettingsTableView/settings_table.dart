import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTable extends StatefulWidget {
  // final List<String> settings;
  final Map<String, Function> settings;

  const SettingsTable({super.key, required this.settings});

  @override
  State<SettingsTable> createState() => _SettingsTableState();
}

class _SettingsTableState extends State<SettingsTable> {
  @override
  Widget build(BuildContext context) {
    List<String> names = widget.settings.keys.toList();
    List<Function> actions = widget.settings.values.toList();
    return SizedBox(
      height: 347.h,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => actions[index].call(),
            child: CupertinoListTile(
              title: Text(
                names[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.white,
                ),
              ),
              trailing: const CupertinoListTileChevron(),
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}
