import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../strings/strings.dart';

class AttachmentTitlePublicWidget extends StatelessWidget {
  const AttachmentTitlePublicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Text(
        Strings.attachments,
        style: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
