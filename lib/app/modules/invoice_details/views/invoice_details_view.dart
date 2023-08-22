import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../controllers/invoice_details_controller.dart';
import '../widgets/invoice_attachments_list.dart';
import '../widgets/invoice_general_details.dart';
import '../widgets/invoice_items/invoice_items_widget.dart';
import '../widgets/invoice_messages_list.dart';
import '../widgets/invoice_property_lease_details.dart';

class InvoiceDetailsView extends GetView<InvoiceDetailsController> {
  const InvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customAppBar(title: Strings.invoice),
          body: Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Row(
                      children: [
                        SvgPicture.asset(ImagePaths.invoice,
                            height: 24.h, width: 26.w),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.invoiceTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.mainColor)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(controller.invoice.description!,
                                style: TextStyle(
                                    fontSize: 18.sp, color: ColorManager.black))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const InvoiceGeneralDetailsWidget(),
                  SizedBox(height: 20.h),
                  const InvoicePropertyLeaseDetailsWidget(),
                  SizedBox(height: 20.h),
                  const InvoiceItemsWidget(),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      Strings.messages,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 200.h, child: const InvoiceMessagesList()),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      Strings.attachments,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const InvoiceAttachmentsList(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),

          drawer:
              customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
