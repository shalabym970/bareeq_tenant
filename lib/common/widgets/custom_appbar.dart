import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    backgroundColor: const Color(0xff00345B),
    title:  Text(title),
    actions:  [
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/images/dashboard/email.svg',
              height: 16, width: 22)
        ),
      ),
      GestureDetector(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/images/dashboard/person.svg',
                height: 16, width: 22)
        ),
      ),
    ],
  );
}
