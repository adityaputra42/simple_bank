import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../theme/theme.dart';

class Empty extends StatelessWidget {
  const Empty(
      {super.key,
      required this.title,
      this.width = 210,
      this.subtitle,
      this.fz,
      this.image,
      this.ontap});
  final String title;
  final String? subtitle;
  final double width;
  final double? fz;
  final Function()? ontap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   AppImage.empty,
          //   width: width.w,
          // ),
          16.0.height,
          Text(
            title,
            style: AppFont.semibold14.copyWith(
                color: Theme.of(context).indicatorColor, fontSize: fz ?? 14.sp),
          ),
          4.0.height,
          subtitle == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: ontap,
                  child: Text(
                    subtitle ?? '',
                    textAlign: TextAlign.center,
                    style: AppFont.medium10
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                )
        ],
      ),
    );
  }
}
