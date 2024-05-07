import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../theme/theme.dart';

class Warning extends StatelessWidget {
  const Warning({super.key, required this.warning, this.color});
  final String warning;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: color ?? AppColor.warningColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline_rounded,
              size: 28.h, color: color ?? AppColor.warningColor),
          12.0.width,
          Expanded(
            child: Text(
              warning,
              style: AppFont.medium12
                  .copyWith(color: color ?? AppColor.warningColor),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
