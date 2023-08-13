import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {Key? key,
      required this.value,
      required this.onChange,
      required this.items,
      required this.label})
      : super(key: key);
  final String value;
  final String label;

  final void Function(String?) onChange;
  final List<DropdownMenuItem<String>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.mainColor)),
        Container(
          color: ColorManager.textFieldBg,
          height: 45.h,
          child: InputDecorator(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  style: TextStyle(
                      color: ColorManager.mainColor,
                      //<-- SEE HERE
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  dropdownColor: ColorManager.white,
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: ColorManager.mainColor),
                  items: items,
                  onChanged: onChange,
                ),
              )),
        ),
      ],
    );
  }
}
