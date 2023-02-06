import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.title})
      : super(key: key);
  final bool value;
  final void Function(bool?) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all<Color>(Colors.black),
          value: value,
          shape: const CircleBorder(),
          onChanged: onChanged,
        ),
        Text(title,
            style: TextStyle(
                fontSize: 14.sp,
                color: ColorManager.black,
                fontWeight: FontWeight.w500))
      ],
    );
  }
}
