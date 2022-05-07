import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.h,
        right: 40.w,
        left: 40.w,
        bottom: 10.h,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFFA4B0BC),
          fontSize: 24.sp,
        ),
      ),
    );
  }
}
