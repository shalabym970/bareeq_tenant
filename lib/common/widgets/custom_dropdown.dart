import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {Key? key,
      required this.value,
      required this.onChange,
      required this.items,
      required this.label,
      required this.hint})
      : super(key: key);
  final dynamic value;
  final String label;
  final String hint;

  final void Function(dynamic) onChange;
  final List<DropdownMenuItem<dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.mainColor)),
      Container(
          color: ColorManager.textFieldBg,
          child: InputDecorator(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<dynamic>(
                      value: value,
                      style: TextStyle(
                          color: ColorManager.mainColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      dropdownColor: ColorManager.white,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorManager.mainColor,
                        size: 20.sp,
                      ),
                      items: items,
                      hint: Text(hint,
                          style: TextStyle(
                              color: ColorManager.grey, fontSize: 12.sp)),
                      onChanged: onChange))))
    ]);
  }
}
