import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/custom_message_card.dart';
import '../../../models/message.dart';



class WorkPermitsItemsList extends StatelessWidget {
  const WorkPermitsItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      primary: false,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: ((_, index) {
        // var playerStanding =
        // controller.playerStandingList.elementAt(index);
        return  CustomMessageCard(message: MessageModel());
      }),

    );
  }
}
