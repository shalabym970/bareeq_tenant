import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class FitOutProcessGeneralDetailsWidget extends StatelessWidget {
  const FitOutProcessGeneralDetailsWidget({Key? key}) : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.office,
                        title: Strings.leaseNumber,
                        value: 'Seef Area (SMS)'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.group77,
                        title: Strings.contactPeriod,
                        value: 'Rent Contract F...'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.group42,
                        title: Strings.type,
                        value: '10'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.pylon,
                        title: Strings.priority,
                        value: 'Not Yet Started')
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
