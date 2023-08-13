import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../color_manager.dart';


class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget(
      {Key? key,
      required this.text,
      required this.svgIconPath,
      required this.onTap})
      : super(key: key);
  final String text;
  final String svgIconPath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            svgIconPath,
            alignment: Alignment.center,
            width: 20.w,
            height: 20.h,
            color: ColorManager.mainColor,
          ),
          SizedBox(width: 20.w),
          Text(
            text,
            style: TextStyle(
                color: ColorManager.mainColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
