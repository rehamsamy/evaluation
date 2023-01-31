 import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'CustomModal.dart';

class Modalhelpers {
  static void showModal(
      {required BuildContext context,
      required String title,
      required Widget content,
      bool expand = false}) {
    showBarModalBottomSheet(
      expand: expand,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => CustomModal(
        content: content,
        title: title,
      ),
    );
  }
}
