import 'package:bareeq/common/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/general_services.dart';
import '../controllers/sold_property_details_controller.dart';

class SoldPropertyGeneralDetailsWidget
    extends GetView<SoldPropertyDetailsController> {
  const SoldPropertyGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(Strings.generalDetails,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
          SizedBox(height: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.deleteCalendar,
                          title: Strings.agreementRef,
                          value: controller.soldProperty.agreementRef ??
                              Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.person,
                          title: Strings.accountName,
                          value: controller.currentUser.account
                              ?.name ??
                              Strings.na,color: ColorManager.grey),
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.documentLayout,
                          title: Strings.type,
                          value: Strings.sold),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.pylon,
                          title: Strings.status,
                          value: controller.soldProperty.agreementStatus != null
                              ? GeneralServices.getKeyFromValue(
                                  Constants.soldPropertyStatusMap,
                                  controller.soldProperty.agreementStatus!)
                              : Strings.na)
                    ]))
          ])
        ]));
  }
}