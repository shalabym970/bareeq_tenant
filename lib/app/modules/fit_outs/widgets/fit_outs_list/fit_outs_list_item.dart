import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class FitOutsListItem extends StatelessWidget {
  const FitOutsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.fitOutDetails);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1.h,
                    blurRadius: 3.h,
                    offset: Offset(0, 3.h), // changes position of shadow
                  ),
                ],
              ),
              height: 116.h,
              child: Card(
                color: ColorManager.textFieldBg,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(Strings.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      color: ColorManager.darkBlue)),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('WP--21--018',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: ColorManager.black))
                            ],
                          ),
                          Column(
                            children: [
                              Text(Strings.completeDate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      color: ColorManager.darkBlue)),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('20/2/2000',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: ColorManager.black))
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
                            children: [
                              Text(
                                Strings.openingDate,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.darkBlue),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('04/3/2033',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: ColorManager.black))
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                Strings.status,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.darkBlue),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('not yet started',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: ColorManager.black))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Strings.startDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.darkBlue)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text('12/10/2022',
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
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
