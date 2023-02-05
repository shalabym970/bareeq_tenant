import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../color_manager.dart';
import '../images_paths.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.validator,
    this.onSaved,
    this.backgroundColor,
    this.labelWidget,
    this.width,
    this.height,
    this.enabled,
    this.suffixIcon,
    this.maxLines,
  }) : super(key: key);
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? backgroundColor;
  final Widget? labelWidget;
  final double? width;
  final double? height;
  final bool? enabled;
  final String? suffixIcon;
  final int? maxLines;

  get svgProfileIcon => null;

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
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              child: TextFormField(
                enabled: enabled ?? true,
                controller: controller,
                autovalidateMode: AutovalidateMode.always,
                cursorColor: ColorManager.darkBlue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: ColorManager.darkBlue,
                        fontWeight: FontWeight.w400),
                    suffixIcon: suffixIcon != null
                        ? SvgPicture.asset(suffixIcon!, height: 5.h, width: 5.w)
                        : null),
                onSaved: onSaved,
                validator: validator,
                maxLines: maxLines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
