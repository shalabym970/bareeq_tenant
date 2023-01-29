import 'package:flutter/cupertino.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_invoices/recent_invoices_list_item.dart';


class RecentInvoicesList extends StatelessWidget {
  const RecentInvoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        primary: false,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: ((_, index) {
          // var playerStanding =
          // controller.playerStandingList.elementAt(index);
          return const RecentInvoicesListItem();
        }),
      ),
    );
  }
}
