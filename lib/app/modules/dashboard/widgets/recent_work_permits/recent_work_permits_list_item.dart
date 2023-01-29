import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class RecentWorkPermitListItem extends StatelessWidget {
  const RecentWorkPermitListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: (){
         Get.toNamed(Routes.workPermitDetails);
        },
          child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 62,
        child: Card(
          color: const Color(0xffF5F7FF),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        style: TextStyle(fontSize: 12, color: Colors.black))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Type',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Color(0xff00345B)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('standard',
                        style: TextStyle(fontSize: 12, color: Colors.black))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Contractor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Color(0xff00345B))),
                    SizedBox(
                      height: 5,
                    ),
                    Text('shalaby',
                        style: TextStyle(fontSize: 12, color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
