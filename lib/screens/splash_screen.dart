import 'package:flutter/material.dart';
import 'package:tesla_mobile_app_concept/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenFunction() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const MainScreen();
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    splashScreenFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
            height: 18.55,
            width: 112.0,
            child: Image.asset('assets/images/logo_white.png')),
      ),
    );
  }
}
