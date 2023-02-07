import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/leases_controller.dart';
import '../widgets/leases_list/leases_list_widget.dart';
import '../widgets/leases_search_widget.dart';


class LeasesView extends GetView<LeasesController> {
  const LeasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.dashboard);
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(title: Strings.leases),

        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LeasesSearchWidget(),
                Expanded(child: LeasesListWidget())
              ]),
        ),

        drawer:
            customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
