import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAttachmentWidget extends StatelessWidget {
  const CustomAttachmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child:Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: 62,
            child: Card(
              color: const Color(0xffF5F7FF),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/work_permit/document.svg',
                        height: 24, width: 21),
                     Align(
                       alignment: Alignment.centerLeft,
                       child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text(
                              'File Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color(0xff00345B)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Wooden tables infrastructure',
                                style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.7)))
                          ],
                        ),
                     ),
                    SizedBox(
                        height: 32,
                        width: 32,
                        child: FloatingActionButton(
                            onPressed: () {},
                            heroTag: null,
                            backgroundColor: const Color(0xff845D3F),
                            child:  SvgPicture.asset('assets/images/work_permit/Path 66.svg',
                                height: 12, width: 12)

                        ),
                      ),

                  ],
                ),
              ),
            ),
          )
    );
  }
}
