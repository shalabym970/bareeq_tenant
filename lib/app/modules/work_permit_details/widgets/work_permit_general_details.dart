import 'package:flutter/cupertino.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/widgets/custom_details_item.dart';


class WorkPermitGeneralDetailsWidget extends StatelessWidget {
  const WorkPermitGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General Details',
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
                      icon: ImagePaths.group42,
                      title: 'Unit',
                      value: '10'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsItem(
                      icon: ImagePaths.documentLayout,
                      title: 'Type',
                      value: 'standard')
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDetailsItem(
                      icon: ImagePaths.manager,
                      title: 'Contractor',
                      value: 'Ahmed Ahmed'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsItem(
                      icon: ImagePaths.shirt,
                      title: 'Customer',
                      value: 'Aml Corporate')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
