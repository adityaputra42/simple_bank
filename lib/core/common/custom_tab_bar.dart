import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class CustomTabBar extends StatelessWidget {
  final int? selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;
  final double fonsize;

  const CustomTabBar({
    super.key,
    required this.titles,
    this.selectedIndex,
    this.fonsize = 14,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: titles
            .map((e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!(titles.indexOf(e));
                      }
                    },
                    child: Container(
                      // height: 36.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Theme.of(context).colorScheme.background,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.lightText1.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 4))
                          ],
                          border: Border.all(
                              width: 1.h,
                              color: titles.indexOf(e) == selectedIndex
                                  ? AppColor.primaryColor
                                  : Colors.transparent)),
                      child: Center(
                        child: Text(
                          e,
                          maxLines: 1,
                          style: AppFont.medium12
                              .copyWith(color: AppColor.darkText3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
