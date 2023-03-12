import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class WorkPermitWorkStatusWidget extends StatelessWidget {
  const WorkPermitWorkStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.workStatus,
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
                        icon: ImagePaths.filingTime,
                        title: Strings.startDate,
                        value: '31-october-2021'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.workers,
                        title: Strings.numberOfWorkers,
                        value: '5')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.filingTime,
                        title: Strings.endDate,
                        value: '31-october-2021'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.pylon,
                        title: Strings.status,
                        value: 'Draft')
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
