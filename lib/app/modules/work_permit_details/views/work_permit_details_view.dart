import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_comments_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_description.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_general_details.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_items_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_messages_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_work_status.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../controllers/work_permit_details_controller.dart';



class WorkPermitDetailsView extends GetView<WorkPermitDetailsController> {
  const WorkPermitDetailsView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Work Permit'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        heroTag: null,
        backgroundColor: const Color(0xff845D3F),
        child:  SvgPicture.asset(ImagePaths.save,
            height: 20, width: 20)
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SvgPicture.asset(ImagePaths.officeBag,
                        height: 24, width: 26),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('subject',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff00345B))),
                        SizedBox(
                          height: 5,
                        ),
                        Text('WP--21--018',
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const WorkPermitGeneralDetailsWidget(),
              const SizedBox(height: 20),
              const WorkPermitWorkStatusWidget(),
              const SizedBox(height: 20),
              const WorkPermitDescription(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Seef Comments',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 185, child: WorkPermitsCommentsList()),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Work Permit Items',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 185, child: WorkPermitsItemsList()),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Messages',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 185, child: WorkPermitsMessagesList()),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Attachments',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              const CustomAttachmentWidget(),
              const SizedBox(height: 10),
              const CustomAttachmentWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      drawer:
          CustomDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
