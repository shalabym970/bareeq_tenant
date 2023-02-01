import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';


class CaseGeneralDetailsWidget extends StatelessWidget {
  const CaseGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            Strings.generalDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
           SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.path79,
                        title: Strings.caseNumber,
                        value: 'CS--21--001'),
                     SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.documentLayout,
                        title: Strings.type,
                        value: 'problem')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.deleteCalendar,
                        title: Strings.dateSubmitted,
                        value: '20-April-2022'),
                     SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.import,
                        title: Strings.priority,
                        value: 'Normal')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
