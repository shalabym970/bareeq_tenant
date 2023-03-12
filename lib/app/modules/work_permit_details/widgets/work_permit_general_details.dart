import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class WorkPermitGeneralDetailsWidget extends StatelessWidget {
  const WorkPermitGeneralDetailsWidget({Key? key}) : super(key: key);

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
                        icon: ImagePaths.group42,
                        title: Strings.unit,
                        value: '10'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.documentLayout,
                        title: Strings.type,
                        value: 'standard')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.manager,
                        title: Strings.contractor,
                        value: 'Ahmed Ahmed'),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.shirt,
                        title: Strings.customer,
                        value: 'Aml Corporate')
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
