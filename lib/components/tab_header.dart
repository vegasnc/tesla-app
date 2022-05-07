import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({
    Key? key,
    required this.label,
    required this.tabIndex,
    required this.activeTabs,
    required this.inactiveTabColor,
  }) : super(key: key);

  final List<int> activeTabs;
  final Color inactiveTabColor;
  final String label;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Text(
        label,
        style: TextStyle(
            color:
                activeTabs.contains(tabIndex) ? Colors.black : inactiveTabColor,
            fontSize: 18.sp),
      ),
    );
  }
}
