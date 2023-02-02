import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../../common/color_manager.dart';
import '../../controllers/messages_controller.dart';
import 'inbox_messages_list_item.dart';

class InboxMessagesList extends GetView<MessagesController> {
  const InboxMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
            child: SizedBox(
              height: 38.h,
              child: InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorManager.primaryBTNColorBrown, width: 2.w),
                    ),
                    border: const OutlineInputBorder(),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.value,
                      style: TextStyle(
                          color: ColorManager.primaryBTNColorBrown,
                          //<-- SEE HERE
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      dropdownColor: ColorManager.white,
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: ColorManager.primaryBTNColorBrown),
                      items: controller.dropList.map((items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) async {},
                    ),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
              primary: false,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: ((_, index) {
                // var playerStanding =
                // controller.playerStandingList.elementAt(index);
                return const InboxMessagesListItem();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
