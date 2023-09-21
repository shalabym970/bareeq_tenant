import 'package:bareeq/common/widgets/custom_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../controllers/messages_controller.dart';
import '../widgets/message_drop_down_List.dart';
import '../widgets/messages_lists/inbox_messages_list.dart';
import '../widgets/messages_switcher_btn.dart';
import '../widgets/messages_lists/sent_messages_list.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customDetailsAppBar(title: Strings.messages),
          body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MessagesSwitcherBTN(),
                    const MessageDropDownList(),
                    Obx(() => controller.selectInboxMessages.isTrue
                        ? const InboxMessagesList()
                        : const SentMessagesList())
                  ])),
        )) : const NoInternetConnectionView());
  }
}
