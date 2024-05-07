import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../theme/theme.dart';

class InputPin extends StatelessWidget {
  const InputPin(
      {super.key,
      this.controller,
      this.onCompleted,
      this.onChange,
      this.pading = EdgeInsets.zero,
      this.obsecure = false,
      this.keyboardType = TextInputType.name,
      this.lenght = 6});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Function(String)? onChange;
  final EdgeInsets pading;
  final int lenght;
  final bool obsecure;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pading,
      child: PinCodeTextField(
        keyboardType: keyboardType,
        autoDisposeControllers: false,
        autoFocus: false,
        appContext: context,
        length: lenght,
        enableActiveFill: true,
        obscureText: obsecure,
        animationType: AnimationType.fade,
        cursorColor: Theme.of(context).indicatorColor,
        textStyle: AppFont.medium14.copyWith(
          color: Theme.of(context).indicatorColor,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        animationDuration: const Duration(milliseconds: 500),
        pinTheme: PinTheme(
          inactiveColor: Theme.of(context).cardColor,
          activeColor: AppColor.primaryColor,
          selectedColor: AppColor.primaryColor,
          selectedFillColor: Theme.of(context).cardColor,
          activeFillColor: Theme.of(context).cardColor,
          inactiveFillColor: Theme.of(context).cardColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          fieldHeight: 40.w,
          fieldWidth: 40.w,
          borderWidth: 0.5.h,
        ),
        controller: controller,
        onCompleted: onCompleted,
        onChanged: onChange,
      ),
    );
  }
}
