import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/horizontal_list_loading.dart';
import '../../../../common/widgets/message_cards/message_card.dart';
import '../../../models/message.dart';
import '../../../routes/app_routes.dart';
import '../controllers/lease_details_controller.dart';

class LeaseMessagesList extends GetView<LeaseDetailsController> {
  const LeaseMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingMessages.isTrue
              ? const HorizontalListLoading()
              : controller.errorMessages.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.messages.isEmpty
                      ? const Center(
                          child:
                              EmptyListWidget(message: Strings.nothingMessages))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.messages.length,
                          itemBuilder: ((_, index) {
                            MessageModel message =
                                controller.messages.elementAt(index);
                            return GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.messagesDetails,
                                      arguments: [
                                        message.direction == true
                                            ? Constants.sentMessage
                                            : Constants.inboxMessage,
                                        message
                                      ])?.then((value) => controller.getMessages());
                                },
                                child: MessageCard(
                                  message: message,
                                ));
                          }),
                        ),
        ));
  }
}
