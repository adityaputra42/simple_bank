import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class TimeframeButton extends StatelessWidget {
  const TimeframeButton(
      {super.key,
      required this.timeframe,
      required this.selectedIndex,
      this.onTap});

  final List<Map<String, dynamic>> timeframe;
  final Map<String, dynamic> selectedIndex;
  final Function(Map<String, dynamic>)? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: timeframe.map((e) {
          return GestureDetector(
            onTap: () => onTap!(e),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 18.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: selectedIndex != e
                      ? null
                      : const LinearGradient(
                          colors: [
                              Color(0xff0163E0),
                              Color(0xff08B2D2),
                            ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
              child: Center(
                child: Text(
                  e['key'],
                  style: AppFont.bold12.copyWith(
                    color: selectedIndex != e
                        ? AppColor.darkText3
                        : AppColor.darkText1,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
