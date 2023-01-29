import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/custom_details_page_card.dart';


class WorkPermitsItemsList extends StatelessWidget {
  const WorkPermitsItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 10),
      primary: false,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: ((_, index) {
        // var playerStanding =
        // controller.playerStandingList.elementAt(index);
        return const CustomDetailsPageCard();
      }),

    );
  }
}
