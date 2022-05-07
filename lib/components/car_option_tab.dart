import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

class CarOption extends StatefulWidget {
  const CarOption({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<CarOption> createState() => _CarOptionState();
}

class _CarOptionState extends State<CarOption> {
  final value = NumberFormat("#,##0", "en_US");
  int activeOption = 0;

  void selectOption(int selectedOption) {
    setState(() {
      activeOption = selectedOption;
    });
  }

  @override
  build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Heading(
          text: 'Select Your Car',
        ),
        Image.asset('assets/images/tesla_red.png'),
        Padding(
          padding: EdgeInsets.only(
            top: 4.h,
            right: 40.w,
            left: 40.w,
            bottom: 40.h,
          ),
          child: Row(
            children: [
              CarPerfomanceOptions(
                text: 'Performance',
                price: '\$55,700',
                index: 0,
                activeOption: activeOption,
                onPressed: () {
                  selectOption(0);
                  Provider.of<PriceTracker>(context, listen: false)
                      .setAmount(55700);
                },
              ),
              SizedBox(
                width: 48.w,
              ),
              CarPerfomanceOptions(
                text: 'Long Range',
                price: '\$46,700',
                index: 1,
                activeOption: activeOption,
                onPressed: () {
                  selectOption(1);
                  Provider.of<PriceTracker>(context, listen: false)
                      .setAmount(46700);
                },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PerformanceDetail(
                    title: '3.5s',
                    subtitle: '0-60 mph',
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Container(
                    color: Colors.black,
                    height: 80.h,
                    width: 1.w,
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  const PerformanceDetail(
                    title: '150mph',
                    subtitle: 'Top Speed',
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                longText,
                style: TextStyle(
                  color: const Color(0xf9797970),
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              BottomRow(onPressed: widget.onPressed),
            ],
          ),
        )
      ]),
    );
  }
}

String longText =
    'Tesla All-Wheel Drive has two independent motors. Unlike traditional all-wheel drive systems, these two motors digitally control torque to the front and rear wheels—for far better handling and traction control. ';

class CarPerfomanceOptions extends StatelessWidget {
  const CarPerfomanceOptions({
    Key? key,
    required this.text,
    required this.price,
    required this.index,
    required this.activeOption,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String price;
  final int index;
  final int activeOption;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 28.sp,
              color: index == activeOption
                  ? Colors.black
                  : const Color(0xFF979797),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            price,
            style: TextStyle(
              color: index == activeOption
                  ? const Color(0xffD01000)
                  : const Color(0xFFA4B0BC),
              fontSize: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}
