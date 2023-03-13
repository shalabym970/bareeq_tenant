import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class WorkPermitsListItem extends StatelessWidget {
  const WorkPermitsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: GestureDetector(
        onTap: (){
         Get.toNamed(Routes.workPermitDetails);
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
        height: 62.h,
        child: Card(
          color:ColorManager.textFieldBg,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(Strings.subject,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color:ColorManager.green)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('WP--21--018',
                        style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      Strings.type,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: ColorManager.green),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('standard',
                        style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(Strings.contractor,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: ColorManager.green)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('shalaby',
                        style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
