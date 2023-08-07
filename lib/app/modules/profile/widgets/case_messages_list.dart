import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/custom_message_card.dart';
import '../../../models/message.dart';
import '../../../models/work_permit_item.dart';

class CaseMessagesList extends StatelessWidget {
  const CaseMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      primary: false,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: ((_, index) {
        // var playerStanding =
        // controller.playerStandingList.elementAt(index);
        return   CustomMessageItemCard( item: WorkPermitItem(),);
      }),
    );
  }
}
