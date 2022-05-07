import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceDetail extends StatelessWidget {
  const PerformanceDetail(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.color})
      : super(key: key);

  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w500, fontSize: 36.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          subtitle,
          style: TextStyle(color: color, fontSize: 14.sp),
        )
      ],
    );
  }
}
