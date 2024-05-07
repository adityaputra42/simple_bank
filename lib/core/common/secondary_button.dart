import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../theme/theme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.height = 48,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderColor,
    this.textColor,
    this.bgColor,
    this.icon,
    this.loading = false,
    required this.onPressed,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Widget? icon;
  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final bool loading;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      width: width,
      height: height.w,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(
                width: 1.h, color: borderColor ?? AppColor.primaryColor),
            backgroundColor: bgColor ?? Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r))),
        onPressed: loading ? () {} : onPressed,
        child: loading
            ? Padding(
                padding: EdgeInsets.all(8.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ? 8.0.width : 0.0.width,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        AppFont.medium14.copyWith(color: AppColor.primaryColor),
                  )
                ],
              ),
      ),
    );
  }
}
