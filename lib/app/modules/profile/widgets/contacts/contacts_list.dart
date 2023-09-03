import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/contact_model.dart';
import '../../controllers/profile_controller.dart';
import 'contacts_list_item.dart';

class ContactsList extends GetView<ProfileController> {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(() => controller.loadingContacts.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 100.h),
              )
            : controller.errorContacts.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w,
                    iconHeight: 20.h,
                    fontSize: 15.sp,
                  )
                : controller.contacts.isEmpty
                    ? const EmptyListWidget(message: Strings.contactsEmpty)
                    : Scrollbar(
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.contacts.length,
                            itemBuilder: ((_, index) {
                              Contact contact =
                                  controller.contacts.elementAt(index);
                              return ContactsListItem(contact: contact);
                            })))));
  }
}
