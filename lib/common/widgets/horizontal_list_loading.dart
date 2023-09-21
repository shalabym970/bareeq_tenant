import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dashboard_shimmer.dart';

class HorizontalListLoading extends StatelessWidget {
  const HorizontalListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      primary: false,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: ((_, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ShimmerWidget.rectangular(
            height: 100.h,
            width: 155.w
          )
        );
      })
    );
  }
}
