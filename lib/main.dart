import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_mobile_app_concept/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

void main() {
  //bool kReleaseMode = true;
  //GitTest
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PriceTracker(),
    )
  ], child: const TeslaApp()));
}

class TeslaApp extends StatelessWidget {
  const TeslaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Gotham Pro'),
        home: const SplashScreen(),
      ),
      designSize: const Size(475, 1082),
    );
  }
}
