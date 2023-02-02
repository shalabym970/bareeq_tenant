import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/messages_controller.dart';
import '../widgets/inbox_messages_list/inbox_messages_list.dart';
import '../widgets/messages_switcher_btn.dart';
import '../widgets/sent_messages_list/sent_messages_list.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.dashboard);
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
            title: Strings.messages, svgEmailIcon: ImagePaths.emailBrown),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MessagesSwitcherBTN(),
            Obx(() => controller.selectInboxMessages.isTrue
                ? const Expanded(child: InboxMessagesList())
                : const Expanded(child: SentMessagesList()))
          ],
        ),

        drawer:
            customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
