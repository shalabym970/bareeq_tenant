import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/invoice_details_controller.dart';

class InvoicePropertyLeaseDetailsWidget extends GetView<InvoiceDetailsController> {
  const InvoicePropertyLeaseDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.propertyLeaseDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: customDetailsItem(
                    icon: ImagePaths.group77,
                    title: Strings.property,
                    value: controller.invoice.advancedPropertyContractId.toString()),
              ),
              Expanded(
                flex: 1,
                child: customDetailsItem(
                    icon: ImagePaths.pylon,
                    title: Strings.status,
                    value: controller.invoice.statusCode.toString()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
