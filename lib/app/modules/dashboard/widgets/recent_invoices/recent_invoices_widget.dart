import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_invoices/recent_invoices_list.dart';
import 'package:property_pro/common/images_paths.dart';


class RecentInvoicesWidget extends StatelessWidget {
  const RecentInvoicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(ImagePaths.moneyNotes,
                        height: 20, width: 20),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Recent Invoices',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32,
                width: 32,
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: null,
                  backgroundColor: const Color(0xff845D3F),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              )
            ],
          ),
          const RecentInvoicesList()
        ],
      ),
    );
  }
}
