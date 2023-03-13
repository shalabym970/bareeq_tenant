import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/invoice_details_controller.dart';
import '../widgets/invoice_general_details.dart';
import '../widgets/invoice_items/invoice_items_widget.dart';
import '../widgets/invoice_messages_list.dart';
import '../widgets/invoice_property_lease_details.dart';

class InvoiceDetailsView extends GetView<InvoiceDetailsController> {
  const InvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.invoice),
      body: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: SingleChildScrollView(
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
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Central Court Painting Materials',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.messages,
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(Routes.createMessage);
                        },
                        heroTag: null,
                        backgroundColor: ColorManager.darkGreen,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 185.h, child: const InvoiceMessagesList()),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  Strings.attachments,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              const CustomAttachmentWidget(svgPrefixIcon: ImagePaths.document),
              SizedBox(height: 10.h),
              const CustomAttachmentWidget(svgPrefixIcon: ImagePaths.image,),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),

      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
