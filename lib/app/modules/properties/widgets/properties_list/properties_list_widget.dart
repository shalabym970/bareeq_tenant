import 'package:bareeq/app/modules/properties/widgets/properties_list/sold_properties_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../controllers/properties_controller.dart';
import 'leased_properties_list.dart';

class PropertiesListWidget extends GetView<PropertiesController> {
  const PropertiesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(children: [
              Row(children: [
                Padding(
                    padding: EdgeInsets.all(6.h),
                    child: SvgPicture.asset(ImagePaths.houseDoor,
                        height: 20.h, width: 20.w)),
                Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Text(Strings.properties,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)))
              ]),
              Obx(() => controller.selectLeasedProperties.isTrue
                  ? const LeasedPropertiesList()
                  : const SoldPropertiesList())
            ])));
  }
}
