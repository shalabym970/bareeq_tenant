import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../images_paths.dart';

class SecondCustomLoading extends StatelessWidget {
  const SecondCustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(ImagePaths.secondLoading,
            width: Get.width,
            height: Get.height / 6,
            alignment: Alignment.center));
  }
}
