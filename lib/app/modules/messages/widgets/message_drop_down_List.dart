import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../controllers/messages_controller.dart';

class MessageDropDownList extends GetView<MessagesController> {
  const MessageDropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: SizedBox(
        height: 38.h,
        child: InputDecorator(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.mainColor, width: 2.w),
              ),
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            ),
            child: DropdownButtonHideUnderline(
                child: Obx(() => DropdownButton<String>(
                      value: controller.selectedValue.value,
                      style: TextStyle(
                          color: ColorManager.mainColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                      dropdownColor: ColorManager.white,
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: ColorManager.mainColor),
                      items: controller.messageType.entries
                          .map((MapEntry<String, String> entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) async {
                        controller.loading.isTrue
                            ? null
                            : controller.selectedValue.value = newValue!;
                      },
                    )))),
      ),
    );
  }
}
