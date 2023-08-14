import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/color_manager.dart';
import '../../../services/state_handler.dart';

class MessageCardItem extends StatelessWidget {
  const MessageCardItem({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        text: TextSpan(
            text: "$label: ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
                color: ColorManager.mainColor),
            children: <TextSpan>[
              TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.7)),
              )
            ]));
  }
}
