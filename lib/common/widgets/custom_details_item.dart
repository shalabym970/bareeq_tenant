import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget CustomDetailsItem({required String icon, required String title, required String value}){
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
            icon,
            height: 24,
            width: 24),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color(0xff00345B))),
            const SizedBox(
              height: 5,
            ),
            Text(value,
                style: const TextStyle(fontSize: 14, color: Colors.black))
          ],
        ),
      )
    ],
  );
}