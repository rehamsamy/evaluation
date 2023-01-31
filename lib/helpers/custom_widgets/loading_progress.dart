
import 'package:evaluation/helpers/core_classes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 20.h),
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          backgroundColor: Colors.grey,
          // valueColor: AlwaysStoppedAnimation(Colors.white),
          color: AppTheme.primaryColor,
        ));
  }
}
