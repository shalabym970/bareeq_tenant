import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';

import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/work_permits_controller.dart';
import '../widgets/work_permits_list/work_permits_list_widget.dart';
import '../widgets/work_permits_search_widget.dart';

class WorkPermitsView extends GetView<WorkPermitsController> {
  const WorkPermitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.dashboard);
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(title: Strings.workPermits),

        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  WorkPermitsSearchWidget(),
                  Expanded(child: WorkPermitsListWidget())
                ]),

        ),

        drawer:
            customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
