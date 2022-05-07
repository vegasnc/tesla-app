import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorOption extends StatelessWidget {
  const ColorOption(
      {Key? key,
      required this.onPressed,
      required this.colorTracker,
      required this.color,
      required this.colorIndex})
      : super(key: key);

  final VoidCallback onPressed;
  final int colorTracker;
  final int colorIndex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: colorTracker == colorIndex
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffE9E9E9),
                border: Border.all(color: const Color(0xFFD01000), width: 5.w),
              )
            : null,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: SizedBox(
            height: 50.h,
            width: 50.h,
          ),
        ),
      ),
    );
  }
}
