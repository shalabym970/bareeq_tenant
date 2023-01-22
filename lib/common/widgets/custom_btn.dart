import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    required this.height,
    this.enabled = true,
  }) : super(key: key);

  final String title;
  final double? width;
  final double height;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      color: ColorManager.primaryBTNColorBrown,
      borderRadius: BorderRadius.circular(5.h),
      child: SizedBox(
        height: height,
          width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: enabled == true
                  ? ColorManager.primaryBTNColorBrown
                  : Colors.grey[400]),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: ColorManager.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
