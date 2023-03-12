import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class ActivityGeneralDetailsWidget extends StatelessWidget {
  const ActivityGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
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
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.deleteCalendar,
                        title: Strings.date,
                        value: '23-November-2022'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.pylon,
                        title: Strings.status,
                        value: 'Pending')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.documentLayout,
                        title: Strings.type,
                        value: 'Standard'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.group42,
                        title: Strings.categories,
                        value: 'categories')
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
