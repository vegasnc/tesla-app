import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

class AutoPilotOption extends StatefulWidget {
  const AutoPilotOption({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<AutoPilotOption> createState() => _AutoPilotOptionState();
}

class _AutoPilotOptionState extends State<AutoPilotOption> {
  int activeOption = 0;

  void selectOption(int selectedOption) {
    setState(() {
      activeOption = selectedOption;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PriceTracker>(context, listen: false).addAmount(5000);
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.55),
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
                          if (activeOption == 1) {
                            Provider.of<PriceTracker>(context, listen: false)
                                .addAmount(2000);
                          }
                          selectOption(0);
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
                              .substractAmount(2000);
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
                  BottomRow(onPressed: widget.onPressed),
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
