import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/contact_model.dart';
import '../../../profile/controllers/profile_controller.dart';
import '../../../profile/widgets/contacts/contacts_list_item.dart';

class ContactsList2 extends GetView<ProfileController> {
  const ContactsList2({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadingContacts.isTrue
        ? VerticalListLoading(height: 100.h)
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
                        }))));
  }
}
