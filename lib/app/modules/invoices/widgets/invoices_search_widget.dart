import 'package:Seef/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../controllers/invoices_controller.dart';

class InvoicesSearchWidget extends GetView<InvoicesController> {
  const InvoicesSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextField(
            hint: 'Search',
            controller: controller.searchController,
            height: 55.h,
            width: 252.w,
          ),
          SizedBox(
            height: 32.h,
            width: 32.w,
            child: FloatingActionButton(
              onPressed: () {},
              heroTag: null,
              backgroundColor: ColorManager.primaryBTNColorBrown,
              child: Icon(
                Icons.filter_tilt_shift,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
