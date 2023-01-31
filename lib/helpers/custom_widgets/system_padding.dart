import 'package:flutter/material.dart';

Widget systemPadding({BuildContext? context, Widget? child}) {
  var mediaQuery = MediaQuery.of(context!);

  return AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: const Duration(milliseconds: 300),
      child: child);
}
