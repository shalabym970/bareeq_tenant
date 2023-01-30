import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings.dart';
import '../../../../routes/app_routes.dart';

class RecentCasesListItem extends StatelessWidget {
  const RecentCasesListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.caseDetails);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.h),
        child: GestureDetector(
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
          height: 116.h,
          child: Card(
            color:ColorManager.textFieldBg,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children:  [
                          Text(Strings.requestNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.darkBlue)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('WP--21--018',
                              style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children:  [
                          Text(Strings.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color:  ColorManager.darkBlue)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('problem',
                              style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children:  [
                          Text(
                           Strings.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.darkBlue),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('test',
                              style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children:  [
                          Text(
                            Strings.priority,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.darkBlue),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('Normal',
                              style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(Strings.date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.darkBlue)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text('12/10/2022',
                          style: TextStyle(fontSize: 12.sp, color: ColorManager.black))
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
