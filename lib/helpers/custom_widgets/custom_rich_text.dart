import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String? text1, text2;
  const CustomRichText({Key? key, this.text1 = "", this.text2 = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "$text1\n", style: Theme.of(context).textTheme.bodyText1),
      TextSpan(text: "$text2", style: Theme.of(context).textTheme.bodyText2),
    ]));
  }
}
