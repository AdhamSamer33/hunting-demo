import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunting_demo/gen/assets.gen.dart';

class SettingsTable extends StatefulWidget {
  final Map<String, Function> settings;
  final Function(double) onHeightCalculated;
  const SettingsTable({super.key, required this.settings, required this.onHeightCalculated});

  @override
  State<SettingsTable> createState() => _SettingsTableState();
}

class _SettingsTableState extends State<SettingsTable> {
  final GlobalKey _listViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Wait for the first frame to calculate height
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateListViewHeight();
    });
  }

  void _calculateListViewHeight() {
    // Ensure the context is valid and get the height after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_listViewKey.currentContext != null) {
        final RenderBox renderBox = _listViewKey.currentContext!.findRenderObject() as RenderBox;
        final size = renderBox.size;
        // Send the calculated height to the parent widget
        widget.onHeightCalculated(size.height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = widget.settings.keys.toList();
    List<Function> actions = widget.settings.values.toList();
    return IntrinsicHeight(
      child: ListView.separated(
        key: _listViewKey,
        shrinkWrap: true,
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
              trailing: Image.asset(
                Assets.images.chevron.keyName,
              ),
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}
