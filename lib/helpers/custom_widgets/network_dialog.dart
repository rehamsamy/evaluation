
import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/helpers/core_classes/app_theme.dart';
import 'package:flutter/cupertino.dart';
void showNetworkErrorDialog(BuildContext? context, dynamic onTap) {
  showCupertinoDialog(
    context: context!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(
         context.locale.languageCode == "en"
             ? "please check your internet connection"
             :
          "تأكد من الاتصال بالانترنت",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryColor,
              fontFamily: AppTheme.fontName),
        ),
        actions: <Widget>[
          CupertinoButton(
            onPressed: onTap,
            child: Text(
             context.locale.languageCode == "en"
                 ? "Try again"
                 :
              "حاول مرة أخرى",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.secondaryColor,
                  fontFamily: AppTheme.boldFont),
            ),
          ),
        ],
      );
    },
  );
}
