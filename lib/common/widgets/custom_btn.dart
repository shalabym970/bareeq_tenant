import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../color_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    required this.height,
    required this.backgroundColor,
    required this.textAndIconColor,  this.svgIcon,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color textAndIconColor;
  final String? svgIcon;
  final double? width;
  final double height;
  final VoidCallback onPressed;

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
              primary: backgroundColor,
              side: BorderSide(
                  width: 2.w, // the thickness
                  color: ColorManager
                      .primaryBTNColorBrown // the color of the border
                  )),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(svgIcon != null)
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child:
                    SvgPicture.asset(svgIcon!, height: 12.h, width: 12.w)),
                Text(
                  title,
                  style: TextStyle(
                    color: textAndIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
