import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:tesla_mobile_app_concept/screens/screens.dart';

enum CarStatus { available, unavailable }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color grayTextColor = const Color(0xFF979797);
  final PageController _pageController = PageController(initialPage: 1);
  final CarouselController _carouselController = CarouselController();

  int activeHeader = 1;

  List<Widget> headers = [
    Text(
      'Tesla Model Y',
      style: TextStyle(color: Colors.white, fontSize: 28.sp),
    ),
    Text(
      'RoadStar',
      style: TextStyle(color: const Color(0xFF979797), fontSize: 28.sp),
    ),
  ];
  List<Widget> cars = [
    const TeslaModelY(
      grayTextColor: Color(0xFF979797),
      carStatus: CarStatus.unavailable,
    ),
    const TeslaModelY(
      grayTextColor: Color(0xFF979797),
      carStatus: CarStatus.available,
    ),
    const TeslaModelY(
      grayTextColor: Color(0xFF979797),
      carStatus: CarStatus.unavailable,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: SizedBox(
            height: 18.55,
            width: 112.0,
            child: Image.asset('assets/images/logo_white.png')),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 100.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tesla',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),

            CarouselSlider(
                items: [
                  Header(
                    text: 'Tesla Model X',
                    index: 0,
                    activeHeaderTracker: activeHeader,
                  ),
                  Header(
                    text: 'Tesla Model Y',
                    index: 1,
                    activeHeaderTracker: activeHeader,
                  ),
                  Header(
                    text: 'Roadstar',
                    index: 2,
                    activeHeaderTracker: activeHeader,
                  ),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                    height: 70.h,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.65,
                    onPageChanged: (index, reasonForChange) {
                      setState(() {
                        activeHeader = index;
                      });
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 450),
                          curve: Curves.easeIn);
                    }
                    //   enlargeCenterPage: true,
                    )),
            SizedBox(
              height: 58.h,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: PageView(
                  children: cars,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      activeHeader = index;
                    });
                    _carouselController.animateToPage(index);
                  },
                )),
            //    TeslaModelY(grayTextColor: grayTextColor),
          ]),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.text,
    required this.index,
    required this.activeHeaderTracker,
  }) : super(key: key);

  final String text;
  final int index;
  final int activeHeaderTracker;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: index == activeHeaderTracker
          ? TextStyle(color: Colors.white, fontSize: 48.sp)
          : TextStyle(color: const Color(0xFF979797), fontSize: 28.sp),
    );
  }
}

class TeslaModelY extends StatelessWidget {
  const TeslaModelY({
    Key? key,
    required this.grayTextColor,
    required this.carStatus,
  }) : super(key: key);

  final Color grayTextColor;
  final CarStatus carStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/car_image.png'),
        carStatus == CarStatus.available
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PerformanceDetail(
                          title: '300 mi',
                          subtitle: 'Range (EPA est.)',
                          color: Colors.white),
                      SizedBox(
                        width: 40.w,
                      ),
                      Container(
                        color: Colors.white,
                        height: 80.h,
                        width: 1.w,
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      const PerformanceDetail(
                        title: 'AWD',
                        subtitle: 'Dual Motor',
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  CapabilitiesWidget(
                    grayTextColor: grayTextColor,
                    text: 'Acceleration:',
                    detail: '0-60 in 3.5s',
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CapabilitiesWidget(
                    grayTextColor: grayTextColor,
                    text: 'Top Speed:',
                    detail: 'Up to 150 mph',
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(height: 70.h),
                  Text(
                    'COMING SOON',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 36.sp),
                  ),
                ],
              ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 88.h),
          child: MainScreenButton(carStatus: carStatus),
        ),
        SizedBox(
          height: 48.h,
        ),
      ],
    );
  }
}

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({
    Key? key,
    required this.carStatus,
  }) : super(key: key);

  final CarStatus carStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 64.h,
      child: TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 24.h)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: const BorderSide(color: Color(0xFFD01000)),
              ))),
          onPressed: () {
            if (carStatus == CarStatus.available) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CarDetail(),
                  ));
            } else {}
          },
          child: Text(
            carStatus == CarStatus.available ? 'ORDER NOW' : 'RESERVE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          )),
    );
  }
}

class CapabilitiesWidget extends StatelessWidget {
  const CapabilitiesWidget({
    Key? key,
    required this.grayTextColor,
    required this.text,
    required this.detail,
  }) : super(key: key);

  final Color grayTextColor;
  final String text;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Text(
        text,
        style: TextStyle(color: grayTextColor, fontSize: 18.sp),
      ),
      Text(
        detail,
        style: TextStyle(color: Colors.white, fontSize: 18.sp),
      )
    ]);
  }
}
