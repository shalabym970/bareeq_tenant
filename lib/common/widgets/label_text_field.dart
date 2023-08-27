import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({Key? key, required this.label, this.isRequired = false})
      : super(key: key);
  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if(isRequired)
      Icon(Icons.star_rate_sharp, color: ColorManager.red, size: 8.sp),
      SizedBox(width: 5.w),
      Text(label,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.mainColor))
    ]);
  }
}
