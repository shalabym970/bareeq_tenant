import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';
import '../strings/strings.dart';

class CustomMessageCard extends StatelessWidget {
  const CustomMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Get.toNamed(Routes.messagesDetails);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(10.h)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.h,
              blurRadius: 3.h,
              offset:  Offset(0, 3.h), // changes position of shadow
            ),
          ],
        ),
        width: 157.h,
        child: Card(
          color:  ColorManager.textFieldBg,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text(Strings.subject,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: ColorManager.darkBlue)),
                 SizedBox(
                  height: 5.h,
                ),
                Text('Carpentry',
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.black.withOpacity(0.7))),
                 SizedBox(
                  height: 10.h,
                ),
                 Expanded(
                   child: Text(
                    'Overall tweaks and finalizations within the entire carpentry area.Overall tweaks and finalizations within the entire carpentry area',
                    style: TextStyle(
                        height: 2.h,
                        fontSize: 12.sp, color: ColorManager.black),maxLines: 4,overflow: TextOverflow.visible,),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
