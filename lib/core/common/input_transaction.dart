import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class InputTransaction extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final Function()? onEditingConmplete;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? precision;
  final Color iconColor;
  final Color buttonColor;
  final Function()? ontap;
  final double height;
  final bool inCheckout;

  final TextEditingController controller;

  const InputTransaction({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.inCheckout = false,
    this.height = 42,
    this.validator,
    this.buttonColor = Colors.transparent,
    this.iconColor = AppColor.primaryColor,
    this.onEditingConmplete,
    this.focusNode,
    this.textInputAction,
    this.ontap,
    this.precision,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.w,
      child: TextFormField(
        onTap: ontap,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9.,]'),
          )
        ],
        validator: validator,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
        onEditingComplete: onEditingConmplete,
        focusNode: focusNode,
        textInputAction: textInputAction,
        controller: controller,
        style:
            AppFont.medium12.copyWith(color: Theme.of(context).indicatorColor),
        textAlign: TextAlign.center,
        showCursor: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: () => removeValueFromInput(context, precision ?? 0),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Icon(
                Icons.remove_rounded,
                size: 20.w,
              ),
            ),
          ),
          suffixIcon: InkWell(
            onTap: () => addValueToInput(context, precision ?? 0),
            child: Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                Icons.add_rounded,
                size: 20.w,
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.w,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.errorColor,
            ),
          ),
          hintText: hint,
          hintStyle: AppFont.reguler12
              .copyWith(color: Theme.of(context).highlightColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).canvasColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).canvasColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }

  void addValueToInput(BuildContext context, int percision) {
    FocusScope.of(context).unfocus();
    var number = 1;
    var decimalPointNumber = number.toString().padRight(percision + 1, '0');
    var maxNumber = double.parse(decimalPointNumber);
    var finalNumber = (1 / maxNumber).toStringAsFixed(percision);
    var existingNumber =
        controller.text != '' ? double.parse(controller.text) : 0;

    controller.text =
        (existingNumber + double.parse(finalNumber)).toStringAsFixed(percision);
    onChanged(controller.text);
  }

  void removeValueFromInput(BuildContext context, int percision) {
    FocusScope.of(context).unfocus();
    var number = 1;
    var decimalPointNumber = number.toString().padRight(percision + 1, '0');
    var maxNumber = int.parse(decimalPointNumber);
    var finalNumber = (1 / maxNumber).toStringAsFixed(percision);

    var existingNumber =
        controller.text != '' ? double.parse(controller.text) : 0.0;
    if (inCheckout == true) {
      if (existingNumber > 1) {
        var removedFinalAmount = (existingNumber - double.parse(finalNumber));

        controller.text = removedFinalAmount == 0
            ? ''
            : removedFinalAmount.toStringAsFixed(percision);
        onChanged(controller.text);
      }
    } else {
      if (existingNumber > 0) {
        var removedFinalAmount = (existingNumber - double.parse(finalNumber));

        controller.text = removedFinalAmount == 0
            ? ''
            : removedFinalAmount.toStringAsFixed(percision);
        onChanged(controller.text);
      }
    }
  }
}
