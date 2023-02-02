
import 'package:evaluation/helpers/constants.dart';
import 'package:evaluation/helpers/core_classes/app_theme.dart';
import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:flutter/material.dart';


Widget bottomSheetTitle(String txt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          width: 30,
        ),
      ),
      Text(
        txt,
        style: TextStyle(
          fontFamily: cairoFont,
          color: AppTheme.primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 30,
          width: 30,
          child: Center(
            child: IconButton(
              onPressed: () {
              pushBack()
;              },
              icon: Icon(
                Icons.close,
                color: AppTheme.primaryColor,
                size: 15,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
