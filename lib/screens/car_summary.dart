import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;

import 'package:tesla_mobile_app_concept/screens/screens.dart';

class CarSummary extends StatefulWidget {
  const CarSummary({Key? key}) : super(key: key);

  @override
  State<CarSummary> createState() => _CarSummaryState();
}

class _CarSummaryState extends State<CarSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/car_summary.png'),
            Container(
              color: Colors.transparent,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.7),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 78.w),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(
                        color: const Color(0xFFA4B0BC),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Text(
                      'Your Model Y',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 48.sp,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      '\$60,700',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 74.h),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 24.h)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                                side:
                                    const BorderSide(color: Color(0xFFD01000)),
                              ))),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const SplashScreen();
                              },
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Platform.isIOS == true
                                    ? Icons.apple
                                    : FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                'Pay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 48.h),
              child: SizedBox(
                  height: 18.55,
                  width: 112.0,
                  child: Image.asset('assets/images/logo_white.png')),
            ),
          ],
        ),
      )),
    );
  }
}
