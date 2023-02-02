import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.validator,
    this.onSaved,
    this.backgroundColor,
    this.labelWidget, this.width, this.height,
  }) : super(key: key);
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? backgroundColor;
  final Widget? labelWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelWidget != null) labelWidget!,
          Container(
            width: width ?? Get.width,
            height: height ?? 40.h,
            decoration: BoxDecoration(
                color: backgroundColor ?? ColorManager.textFieldBg,
                borderRadius: BorderRadius.circular(7.h)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              child: TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: ColorManager.darkBlue,
                        fontWeight: FontWeight.w400)),
                onSaved: onSaved,
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
