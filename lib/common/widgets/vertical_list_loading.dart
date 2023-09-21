import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dashboard_shimmer.dart';

class VerticalListLoading extends StatelessWidget {
  const VerticalListLoading({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        primary: false,
        shrinkWrap: true,
        itemCount: 1.sh / 1.5 ~/ height,
        itemBuilder: ((_, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ShimmerWidget.rectangular(height: height));
        }));
  }
}
