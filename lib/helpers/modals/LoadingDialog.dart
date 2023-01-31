
import 'package:bot_toast/bot_toast.dart';
import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/screens/auth/view/auth_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core_classes/my_colors.dart';
import '../custom_widgets/text.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCubeGrid(
        color: color ?? MyColors.primary,
        size: 40.0,
      ),
    );
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "Confirm");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog("loginToContinue",
            () => pushAndRemoveUntil(AuthView()), context, "enter");
      },
    );
  }

  static Widget _alertDialog(
      String title, Function() confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: MyText(
        title: title,
        size: 12,
        color: MyColors.black,
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: MyText(
            title: "Back",
            size: 12,
            color: MyColors.blackOpacity,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: MyText(
            title: okText,
            size: 12,
            color: MyColors.blackOpacity,
          ),
          onPressed: confirm,
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, Alignment? alignment}) {
    BotToast.showSimpleNotification(
        title: msg,
        align: alignment ?? Alignment.bottomCenter,
        backgroundColor: color ?? MyColors.notifyColor,
        titleStyle: TextStyle(color: textColor ?? MyColors.white),
        duration: Duration(seconds: 3),
        hideCloseButton: false,
        closeIcon: Icon(
          Icons.close,
          size: 25,
          color: MyColors.white,
        ));
  }

  static showSimpleToast(msg) {
    BotToast.showText(text: msg,);
  }
}
