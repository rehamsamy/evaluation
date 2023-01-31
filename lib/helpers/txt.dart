
import 'package:evaluation/helpers/core_classes/app_theme.dart';
import 'package:flutter/material.dart';

class BottomSheetTitle extends StatelessWidget {
  final String txt;
  const BottomSheetTitle(this.txt);

  @override
  Widget build(BuildContext context) {
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
                  // Get.back();
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  color: AppTheme.secondaryColor,
                  size: 15,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
