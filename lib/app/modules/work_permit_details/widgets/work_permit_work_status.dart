import 'package:flutter/cupertino.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/widgets/custom_details_item.dart';


class WorkPermitWorkStatusWidget extends StatelessWidget {
  const WorkPermitWorkStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Work Status',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDetailsItem(
                      icon: ImagePaths.filingTime,
                      title: 'Start Date',
                      value: '31-october-2021'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsItem(
                      icon: ImagePaths.workers,
                      title: 'Number of Workers',
                      value: '5')
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDetailsItem(
                      icon: ImagePaths.filingTime,
                      title: 'End Date',
                      value: '31-october-2021'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsItem(
                      icon: ImagePaths.pylon,
                      title: 'Status',
                      value: 'Draft')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
