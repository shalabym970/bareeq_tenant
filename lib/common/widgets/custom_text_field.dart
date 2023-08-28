import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.validator,
      this.onSaved,
      this.backgroundColor,
      this.labelWidget,
      this.width,
      this.height,
      this.enabled,
      this.stringSuffixIcon,
      this.maxLines,
      this.obscureText = false,
      this.suffixIcon,
      this.onChanged,
      this.focusNode,
      this.keyboardType,
      this.readOnly})
      : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? backgroundColor;
  final Widget? labelWidget;
  final double? width;
  final double? height;
  final bool? enabled;
  final String? stringSuffixIcon;
  final int? maxLines;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? readOnly;

  get svgProfileIcon => null;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (labelWidget != null) labelWidget!,
              Container(
                  width: width ?? Get.width,
                  height: height,
                  decoration: BoxDecoration(
                      color: backgroundColor ?? ColorManager.textFieldBg,
                      borderRadius: BorderRadius.circular(7.h)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: TextFormField(
                          enabled: enabled ?? true,
                          controller: controller,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              errorStyle:
                                  TextStyle(color: Colors.red, fontSize: 10.sp),
                              border: InputBorder.none,
                              hintText: hint,
                              hintStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor,
                                  fontWeight: FontWeight.w400),
                              suffixIcon: stringSuffixIcon != null
                                  ? Icon(
                                      Icons.calendar_month_outlined,
                                      size: 30.sp,
                                      color: ColorManager.mainColor,
                                    )
                                  : null),
                          onSaved: onSaved,
                          validator: validator,
                          maxLines: obscureText == true ? 1 : maxLines,
                          obscureText: obscureText,
                          onChanged: onChanged,
                          focusNode: focusNode,
                          keyboardType: keyboardType,
                          readOnly: readOnly ?? false)))
            ])));
  }
}
