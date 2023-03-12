import 'package:Seef/common/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FirstCustomLoading extends StatelessWidget {

  const FirstCustomLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(ImagePaths.firstLoading,
          width: Get.width, height: Get.height/3, alignment: Alignment.center),
    );
  }
}
