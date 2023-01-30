import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class InvoicePropertyLeaseDetailsWidget extends StatelessWidget {
  const InvoicePropertyLeaseDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.propertyLeaseDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              customDetailsItem(
                  icon: ImagePaths.group77,
                  title: Strings.property,
                  value: 'Rent Contract F...'),
              SizedBox(
                width: 60.w,
              ),
              customDetailsItem(
                  icon: ImagePaths.pylon, title: Strings.status, value: 'New'),
            ],
          )
        ],
      ),
    );
  }
}
