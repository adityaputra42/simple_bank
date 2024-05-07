import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChange,
    this.validator,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction,
  });

  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppFont.medium14.copyWith(
        color: Theme.of(context).indicatorColor,
      ),
      controller: controller,
      onChanged: onChange,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20.w,
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          hintText: "Search",
          hintStyle: AppFont.reguler14.copyWith(
              fontWeight: FontWeight.w300,
              color: Theme.of(context).highlightColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w)),
    );
  }
}
