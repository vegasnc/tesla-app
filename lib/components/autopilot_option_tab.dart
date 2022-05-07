import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

class AutoPilotOption extends StatefulWidget {
  const AutoPilotOption({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<AutoPilotOption> createState() => _AutoPilotOptionState();
}

class _AutoPilotOptionState extends State<AutoPilotOption> {
  int activeOption = 0;
  final value = NumberFormat("#,##0", "en_US");

  void selectOption(int selectedOption) {
    setState(() {
      activeOption = selectedOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset('assets/images/automated_driving.png'),
          Container(
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 48.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Autopilot',
                    style: TextStyle(
                      color: const Color(0xFFA4B0BC),
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Row(
                    children: [
                      AutoPilotOptions(
                        text: 'Full Self-Driving',
                        price: '\$5000',
                        index: 0,
                        activeOption: activeOption,
                        onPressed: () {
                          selectOption(0);
                          Provider.of<PriceTracker>(context, listen: false)
                              .setPrice(63700);
                        },
                      ),
                      SizedBox(
                        width: 48.w,
                      ),
                      AutoPilotOptions(
                        text: 'Autopilot',
                        price: '\$3000',
                        index: 1,
                        activeOption: activeOption,
                        onPressed: () {
                          selectOption(1);
                          Provider.of<PriceTracker>(context, listen: false)
                              .setPrice(60700);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    autopilotText,
                    style: TextStyle(
                      color: const Color(0xf9797970),
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 46.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${value.format(Provider.of<PriceTracker>(context, listen: false).totalAmount)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.sp,
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(vertical: 24.h)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                    side: const BorderSide(
                                        color: Color(0xFFD01000)),
                                  ))),
                              onPressed: widget.onPressed,
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AutoPilotOptions extends StatelessWidget {
  const AutoPilotOptions({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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

const String autopilotText =
    'Atomatic driving from highway on-rampto off-ramp including interchanges and overtaking slower cars.';
