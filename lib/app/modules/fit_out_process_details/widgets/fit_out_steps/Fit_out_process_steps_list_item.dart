import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../routes/app_routes.dart';

class FitOutStepCard extends StatelessWidget {
  const FitOutStepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.activity);
      },
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
        width: 157.h,
        child: Card(
          color: ColorManager.textFieldBg,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Getting Started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: ColorManager.darkBlue)),
                SizedBox(
                  height: 5.h,
                ),
                Text('Pending',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorManager.primaryBTNColorBrown)),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: Text(
                  'Once the documentation and lease agreement have been finalized, the tenant to • Appoint their fitout team. (Form 2) • Attend formal meeting with SEEF Fit-Out Team to agree on the procedures for Fit-Out • Understand the design criteria and deliverables • Submit fit-out program milestone prior to the submission of conceptual design. (Form 3) • Artwork for hoarding to be submitted for approval.',
                  style: TextStyle(
                      height: 2.h, fontSize: 12.sp, color: ColorManager.black),
                  maxLines: 4,
                  overflow: TextOverflow.visible,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
