import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

class ExteriorOption extends StatefulWidget {
  const ExteriorOption({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  @override
  State<ExteriorOption> createState() => _ExteriorOptionState();
}

class _ExteriorOptionState extends State<ExteriorOption> {
  final value = NumberFormat("#,##0", "en_US");
  final PageController _pageController = PageController(initialPage: 3);

  int _colorTracker = 4;

  List<Image> carImages = [
    Image.asset('assets/images/tesla_black.png'),
    Image.asset('assets/images/tesla_midnight_blue.png'),
    Image.asset('assets/images/tesla_blue.png'),
    Image.asset('assets/images/tesla_white.png'),
    Image.asset('assets/images/tesla_red.png'),
  ];

  List<String> colorNames = [
    'Solid Black',
    'Midnight Silver Metallic',
    'Deep Blue Metallic',
    'Pearl White Multi-Coat',
    'Red Multi-Coat',
  ];

  List<Color> colorOptions = [
    Colors.black,
    const Color(0xff45525C),
    const Color(0xff044BB6),
    Colors.white,
    const Color(0xFFD01000)
  ];

  void selectColor(int selectedColor) {
    _pageController.animateToPage(selectedColor - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    setState(() {
      _colorTracker = selectedColor;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PriceTracker>(context, listen: false).addAmount(2000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(
            text: 'Select Your Color',
          ),
          SizedBox(
            height: 450.h,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: carImages,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.h,
              right: 40.w,
              left: 40.w,
              bottom: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  colorNames[_colorTracker - 1],
                  style: TextStyle(
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  '\$2,000',
                  style: TextStyle(
                    color: const Color(0xFFD01000),
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColorOption(
                        onPressed: () {
                          selectColor(1);
                        },
                        colorTracker: _colorTracker,
                        color: colorOptions[0],
                        colorIndex: 1),
                    ColorOption(
                        onPressed: () {
                          selectColor(2);
                        },
                        colorTracker: _colorTracker,
                        color: colorOptions[1],
                        colorIndex: 2),
                    ColorOption(
                        onPressed: () {
                          selectColor(3);
                        },
                        colorTracker: _colorTracker,
                        color: colorOptions[2],
                        colorIndex: 3),
                    ColorOption(
                        onPressed: () {
                          selectColor(4);
                        },
                        colorTracker: _colorTracker,
                        color: colorOptions[3],
                        colorIndex: 4),
                    ColorOption(
                        onPressed: () {
                          selectColor(5);
                        },
                        colorTracker: _colorTracker,
                        color: colorOptions[4],
                        colorIndex: 5),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 1.h,
                  color: const Color(0xFFCFD3D9),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  '20’’ Performance Wheels',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Carbon fiber spoiler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 46.h,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 48.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 28.h),
                BottomRow(onPressed: widget.onPressed),
              ],
            ),
          )
        ],
      ),
    );
  }
}
