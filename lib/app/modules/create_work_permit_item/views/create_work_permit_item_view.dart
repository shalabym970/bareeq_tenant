import 'package:Bareeq/common/strings/error_strings.dart';
import 'package:Bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../controllers/create_work_permit_item_controller.dart';
import '../widgets/select_item_types_widget.dart';

class CreateWorkPermitItemView extends GetView<CreateWorkPermitItemController> {
  const CreateWorkPermitItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: customAppBar(title: Strings.newItem),
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 30.h, right: 15.w, left: 15.w, bottom: 10.h),
              child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                        key: controller.workItemKey,
                        child: Column(children: [
                          Column(children: [
                            const SelectItemTypesWidget(),
                            SizedBox(height: 20.h),
                            CustomTextField(
                                height: 105.h,
                                hint: Strings.enterDescriptionHere,
                                controller: controller.descriptionController,
                                validator: (value) => value!.isEmpty
                                    ? ErrorStrings.enterDetails
                                    : null,
                                labelWidget: const LabelTextField(
                                    label: Strings.description,
                                    isRequired: true),
                                maxLines: 6),
                            SizedBox(height: 50.h),
                            PrimaryButton(
                                title: Strings.createItem,
                                onPressed: () =>
                                    controller.submitWorkPermitItem(),
                                height: 40.h,
                                backgroundColor: ColorManager.mainColor,
                                textAndIconColor: ColorManager.white),
                            SizedBox(height: 50.h)
                          ])
                        ]))
                  ]))),
          Obx(() => Visibility(
              visible: controller.submitLoading.isTrue ? true : false,
              child: const Opacity(
                  opacity: 0.8,
                  child:
                      ModalBarrier(dismissible: false, color: Colors.black)))),
          Obx(() => Visibility(
              visible: controller.submitLoading.isTrue ? true : false,
              child: const Center(child: SecondCustomLoading())))
        ]),
        drawer: customDrawer());
  }
}
