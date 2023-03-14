import 'package:Seef/common/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../images_paths.dart';
import '../strings/error_strings.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key,
      required this.iconWidth,
      required this.iconHeight,
      required this.fontSize})
      : super(key: key);
  final double iconWidth;
  final double iconHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImagePaths.error,
            height: iconHeight, width: iconWidth),
        SizedBox(
          width: 10.w,
        ),
        Text(
          ErrorStrings.publicErrorMessage,
          style: TextStyle(
              fontSize: fontSize,
              color: ColorManager.red,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
