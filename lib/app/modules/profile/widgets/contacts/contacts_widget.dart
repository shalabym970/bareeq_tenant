import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/profile_controller.dart';
import 'contacts_list.dart';

class ContactsWidget extends GetView<ProfileController> {
  const ContactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.contacts)
                      ?.then((value) => controller.getContacts());
                },
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(ImagePaths.employee,
                          height: 20.h, width: 20.w)),
                  Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(Strings.contacts,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)))
                ])),
            SizedBox(
                height: 32.h,
                width: 32.w,
                child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.addNewContact);
                    },
                    heroTag: null,
                    backgroundColor: ColorManager.mainColor,
                    child: Icon(Icons.add,
                        color: ColorManager.white, size: 20.sp)))
          ]),
          const ContactsList()
        ]));
  }
}
