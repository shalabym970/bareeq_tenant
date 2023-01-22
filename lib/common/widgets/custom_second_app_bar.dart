import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

class CustomSecondAppBar extends StatelessWidget {
  const CustomSecondAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:   BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'ImagePath.backgroundPng',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
            child: Center(
              child: Text(
                title,
                style:
                TextStyle(color: ColorManager.white, fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
          )
        ],
      ),
    );
  }
}
