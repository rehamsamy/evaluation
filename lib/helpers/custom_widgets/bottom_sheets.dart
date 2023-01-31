import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core_classes/app_theme.dart';

void displayDefaultBottomSheet(
    {@required BuildContext? context,
    @required String? text,
    @required dynamic onClicked}) {
  showModalBottomSheet(
      context: context!,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(9),
          color: Colors.grey[300],
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: 50,
            decoration: BoxDecoration(
              // color: Colors.grey[300],
              color: Color(0xffF2F2E5),
              // border: Border.all(),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(CupertinoIcons.location),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: AutoSizeText(
                          context.locale.languageCode == "en"
                              ? "Please activate location service to take your location"
                              : "برجاء تفعيل خدمه الموقع وذلك للسماح بتحديد موقع الاعلان",
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onClicked,
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
//                   context.locale.languageCode =="en"?"App settings":
                          "اعدادات التطبيق",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
