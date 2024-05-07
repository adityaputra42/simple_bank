import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      this.height = 48,
      this.width = double.infinity,
      this.margin = EdgeInsets.zero,
      required this.onPressed,
      this.disable = false,
      this.activeColor = AppColor.primaryColor,
      this.disableColor = AppColor.grayColor,
      this.bgColor,
      this.icon,
      this.loading = false,
      this.child});

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Function() onPressed;
  final Color activeColor;
  final Color disableColor;
  final Color? bgColor;
  final bool disable;
  final bool loading;
  final Widget? icon;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: bgColor ?? Colors.transparent,
            foregroundColor: AppColor.darkText1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: disable || loading ? () {} : onPressed,
        child: child ??
            (loading
                ? Padding(
                    padding: EdgeInsets.all(8.h),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.darkText1,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? const SizedBox(),
                      icon != null ? 4.0.width : 0.0.width,
                      Expanded(
                        child: Text(
                          title,
                          style: AppFont.medium12
                              .copyWith(color: AppColor.darkText1),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
