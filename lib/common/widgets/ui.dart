import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Ui {
  static GetSnackBar successSnackBar(
      {String title = 'Success', String? message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headlineSmall
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(30.h),
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline,
          size: 32.sp, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      borderRadius: 8.h,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
    );
  }

  static GetSnackBar errorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headlineSmall
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(30.h),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline,
          size: 32.sp, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      borderRadius: 8.h,
      duration: const Duration(seconds: 3),
    );
  }

  static GetSnackBar defaultSnackBar(
      {String title = 'Alert', String? message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headlineSmall
              ?.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20.h),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded,
          size: 32.sp, color: Get.theme.hintColor),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      borderRadius: 8.h,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar notificationSnackBar(
      {String title = 'Notification',
      String? message,
      OnTap? onTap,
      Widget? mainButton}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      onTap: onTap,
      mainButton: mainButton,
      titleText: Text(title.tr,
          style: Get.textTheme.headlineSmall
              ?.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message!,
          style: Get.textTheme.caption
              ?.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(20.h),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.notifications_none,
          size: 32.sp, color: Get.theme.hintColor),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      borderRadius: 8.h,
      duration: const Duration(seconds: 5),
    );
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: const Color(0xFFFFB24D));
    });
    if (rate - rate.floor() > 0) {
      list.add(
          Icon(Icons.star_half, size: size, color: const Color(0xFFFFB24D)));
    }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border,
          size: size, color: const Color(0xFFFFB24D));
    }));
    return list;
  }

  static BoxDecoration getBoxDecoration(
      {Color? color, double? radius, Border? border, Gradient? gradient}) {
    return BoxDecoration(
      color: color ?? Get.theme.primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
      boxShadow: [
        BoxShadow(
            color: Get.theme.focusColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5)),
      ],
      border:
          border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
      gradient: gradient,
    );
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
          : const SizedBox(),
      prefixIconConstraints: iconData != null
          ? const BoxConstraints.expand(width: 38, height: 38)
          : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static AlignmentDirectional getAlignmentDirectional(
      String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

  static CrossAxisAlignment getCrossAxisAlignment(String textPosition) {
    switch (textPosition) {
      case 'top_start':
        return CrossAxisAlignment.start;
      case 'top_center':
        return CrossAxisAlignment.center;
      case 'top_end':
        return CrossAxisAlignment.end;
      case 'center_start':
        return CrossAxisAlignment.center;
      case 'center':
        return CrossAxisAlignment.center;
      case 'center_end':
        return CrossAxisAlignment.center;
      case 'bottom_start':
        return CrossAxisAlignment.start;
      case 'bottom_center':
        return CrossAxisAlignment.center;
      case 'bottom_end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

  static bool isDesktop(BoxConstraints constraint) {
    return constraint.maxWidth >= 1280;
  }

  static bool isTablet(BoxConstraints constraint) {
    return constraint.maxWidth >= 768 && constraint.maxWidth <= 1280;
  }

  static bool isMobile(BoxConstraints constraint) {
    return constraint.maxWidth < 768;
  }

  static double col12(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth;
    } else if (isTablet(constraint)) {
      return tabletWidth;
    } else {
      return desktopWidth;
    }
  }

  static double col9(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 3 / 4;
    } else if (isTablet(constraint)) {
      return tabletWidth * 3 / 4;
    } else {
      return desktopWidth * 3 / 4;
    }
  }

  static double col8(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 2 / 3;
    } else if (isTablet(constraint)) {
      return tabletWidth * 2 / 3;
    } else {
      return desktopWidth * 2 / 3;
    }
  }

  static double col6(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth / 2;
    } else if (isTablet(constraint)) {
      return tabletWidth / 2;
    } else {
      return desktopWidth / 2;
    }
  }

  static double col4(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 1 / 3;
    } else if (isTablet(constraint)) {
      return tabletWidth * 1 / 3;
    } else {
      return desktopWidth * 1 / 3;
    }
  }

  static double col3(BoxConstraints constraint,
      {double desktopWidth = 1280,
      double tabletWidth = 768,
      double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 1 / 4;
    } else if (isTablet(constraint)) {
      return tabletWidth * 1 / 4;
    } else {
      return desktopWidth * 1 / 4;
    }
  }

// static AppBar appBar({required String screenName}) {
//   return AppBar(
//     backgroundColor: ColorManager.mainColor,
//     title: Center(
//       child: Padding(
//         padding: EdgeInsets.only(left: 60.w),
//         child: Text(
//           screenName,
//           style: TextStyle(color: Colors.white, fontSize: 18.sp),
//         ),
//       ),
//     ),
//     actions: [
//       InkWell(
//         onTap: () {
//           Get.toNamed(Routes.notifications);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.w),
//           child: Stack(
//             children: [
//               SvgPicture.asset(
//                 ImagePath.bellSvg,
//                 width: 30.w,
//                 height: 30.h,
//               ),
//               if (Get.find<FirebaseMessagingService>()
//                   .notificationsCount
//                   .value !=
//                   0)
//                 Align(
//                     alignment: Alignment.topCenter,
//                     child: Obx(() => Container(
//                       height: 18.h,
//                       width: 18.w,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 1.w,
//                         ),
//                       ),
//                       child: Text(
//                         Get.find<FirebaseMessagingService>()
//                             .notificationsCount
//                             .value
//                             .toString(),
//                         style: TextStyle(
//                             fontSize: 9.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ))),
//             ],
//           ),
//         ),
//       ),
//
//     ],
//   );
// }
}
