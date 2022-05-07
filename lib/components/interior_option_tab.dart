import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:tesla_mobile_app_concept/util/price_tracker.dart';

class InteriorOption extends StatefulWidget {
  const InteriorOption({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<InteriorOption> createState() => _InteriorOptionState();
}

class _InteriorOptionState extends State<InteriorOption> {
  int activeOption = 0;
  int colorTracker = 1;
  final value = NumberFormat("#,##0", "en_US");

  void selectOption(int selectedOption) {
    setState(() {
      activeOption = selectedOption;
      colorTracker = selectedOption + 1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<PriceTracker>(context, listen: false).addAmount(1000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Image.asset('assets/images/tesla_interior_white.png'),
          Container(
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
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
                    'Select Interior',
                    style: TextStyle(
                      color: const Color(0xFFA4B0BC),
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Row(
                    children: [
                      InteriorOptions(
                        text: 'Black and White',
                        price: '\$1000',
                        index: 0,
                        activeOption: activeOption,
                      ),
                      SizedBox(
                        width: 48.w,
                      ),
                      InteriorOptions(
                        text: 'All Black',
                        price: 'Included',
                        index: 1,
                        activeOption: activeOption,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      ColorOption(
                          onPressed: () {
                            if (colorTracker == 2) {
                              Provider.of<PriceTracker>(context, listen: false)
                                  .addAmount(1000);
                            }
                            selectOption(0);
                          },
                          colorTracker: colorTracker,
                          color: const Color(0xffE2E2E2),
                          colorIndex: 1),
                      SizedBox(width: 40.w),
                      ColorOption(
                          onPressed: () {
                            selectOption(1);

                            Provider.of<PriceTracker>(context, listen: false)
                                .substractAmount(1000);
                          },
                          colorTracker: colorTracker,
                          color: Colors.black,
                          colorIndex: 2),
                    ],
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

class InteriorOptions extends StatelessWidget {
  const InteriorOptions({
    Key? key,
    required this.text,
    required this.price,
    required this.index,
    required this.activeOption,
  }) : super(key: key);

  final String text;
  final String price;
  final int index;
  final int activeOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 28.sp,
            color:
                index == activeOption ? Colors.black : const Color(0xFF979797),
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
    );
  }
}
