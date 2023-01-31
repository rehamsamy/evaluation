import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

AwesomeDialog visitorDialog(BuildContext context) {
  return AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: context.locale.languageCode == "en"
          ? "Please login firstly"
          : "قم بتسجيل الدخول أولا",
      desc: context.locale.languageCode == "en"
          ? "Go to login page ?"
          : "هل تريد الذهاب لتسجيل الدخول ؟",
      dismissOnTouchOutside: true,
      btnOkText: context.locale.languageCode == "en" ? "Accept" : "موافق",
      btnCancelText: context.locale.languageCode == "en" ? "Cancel" : "رفض",
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        // Get.offAllNamed("/SplashView");
      })
    ..show();
}
