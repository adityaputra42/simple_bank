import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../../theme/theme.dart';

class WidgetHelper {
  static appBar(
      {required BuildContext context,
      Function()? onTap,
      Function()? onTapTitle,
      required String title,
      Widget? icon,
      Widget? iconTitle,
      Color? color,
      double fontSize = 14,
      List<Widget>? actions,
      bool isCanBack = true}) {
    return AppBar(
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            isCanBack
                ? GestureDetector(
                    onTap: onTap ??
                        () {
                          Navigator.pop(context);
                        },
                    child: Container(
                      width: 32.h,
                      height: 32.h,
                      padding: EdgeInsets.all(6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            width: 1.w,
                            color: Theme.of(context).canvasColor,
                          )),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).highlightColor,
                        size: 20.h,
                      ),
                    ))
                : 40.0.width,
            actions != null ? 75.0.width : 0.0.width,
            Expanded(
              child: GestureDetector(
                onTap: onTapTitle ?? () {},
                child: iconTitle != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppFont.medium14.copyWith(
                                color: Theme.of(context).indicatorColor,
                                fontSize: fontSize.sp),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconTitle
                        ],
                      )
                    : Text(
                        title,
                        style: AppFont.medium14.copyWith(
                            color: Theme.of(context).indicatorColor,
                            fontSize: fontSize.sp),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
            icon ?? 40.0.width,
          ],
        ),
      ),
      actions: actions,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Theme.of(context).colorScheme.background,
      toolbarHeight: 60.h,
    );
  }
}
