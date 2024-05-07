import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_bank/core/utils/utils.dart';

import '../theme/theme.dart';

class InputText extends StatelessWidget {
  final String? title;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Color? color;
  final Function()? ontaped;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLine;
  final Widget? crossTitle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool enable;
  final bool cursor;
  final bool autoFocus;
  const InputText(
      {super.key,
      this.obscureText = false,
      this.title,
      required this.hintText,
      this.enable = true,
      this.cursor = true,
      this.autoFocus = false,
      this.onChange,
      this.ontaped,
      this.textInputAction,
      this.icon,
      this.maxLine = 1,
      this.crossTitle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.color,
      this.inputFormatters,
      this.focusNode,
      this.prefixIcon,
      this.suffix,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title ?? '',
                          style: AppFont.medium14.copyWith(
                            color: Theme.of(context).indicatorColor,
                          )),
                      crossTitle ?? const SizedBox()
                    ],
                  ),
                  8.0.height,
                ],
              ),
        TextFormField(
            focusNode: focusNode,
            onChanged: onChange,
            validator: validator,
            autofocus: autoFocus,
            showCursor: cursor,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            onTap: ontaped,
            maxLines: maxLine,
            maxLength: maxLength,
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
            decoration: InputDecoration(
              enabled: enable,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              suffixIcon: icon,
              suffix: suffix,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: AppFont.reguler14.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).highlightColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    color: Theme.of(context).canvasColor, width: 1.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    color: Theme.of(context).canvasColor, width: 1.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                    color: Theme.of(context).canvasColor, width: 1.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: AppColor.primaryColor),
              ),
            )),
      ],
    );
  }
}
