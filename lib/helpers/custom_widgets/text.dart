import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core_classes/app_theme.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final TextAlign? alien;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  MyText({required this.title,required this.color,required this.size, this.alien,this.decoration,this.overflow,this.fontWeight=FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: alien??TextAlign.start,
      textScaleFactor: 1.2,
//      overflow: TextOverflow.ellipsis,
//       style: context.locale.languageCode=="ar"?
//       GoogleFonts.cairo(
//           color: color??Colors.black,
//           fontSize: size??16,
//           decoration: decoration??TextDecoration.none,
//           fontWeight: fontWeight
//       ):
//       GoogleFonts.roboto(
//           color: color??Colors.black,
//           fontSize: size??16,
//           decoration: decoration??TextDecoration.none,
//           fontWeight: fontWeight
//       ),
      overflow: overflow,
    );
  }
}

Widget titleText(String txt) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 12),
    child: Text(
      txt,
//      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppTheme.mainTextColor,
          fontSize: 14,
          fontFamily: AppTheme.boldFont,
          fontWeight: FontWeight.w900),
    ).tr(),
  );
}

Widget textFieldTextForOffers(String txt, {optional}) {
  return Padding(
      padding: const EdgeInsets.only(
          right: 25, left: 25, top: AppTheme.sizedBoxHeight, bottom: 8),
      child: RichText(
        text: new TextSpan(
          children: <TextSpan>[
            new TextSpan(
              text: lang.tr(txt),
              style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 15,
                  fontFamily: Family.regular,
                  fontWeight: FontWeight.w700),
            ),
            new TextSpan(
              text: optional == null ? "" : lang.tr(optional),
              style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 12,
                  fontFamily: Family.regular,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )

//     Text(
//       txt,
// //      textAlign: TextAlign.center,
//       style: TextStyle(
//           color: Color(0xff5E5E5E")),
//           fontSize: 15,
//
//           fontFamily: Family.regular,
//           fontWeight: FontWeight.w700),
//     ).tr(),
      );
}

Widget textFieldTextForOffersWithoutPadding(String txt, {optional}) {
  return Padding(
      padding: const EdgeInsets.only(
          right: 5, left: 5, top: AppTheme.sizedBoxHeight),
      child: RichText(
        text: new TextSpan(
          children: <TextSpan>[
            new TextSpan(
              text: lang.tr(txt),
              style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 15,
                  fontFamily: Family.regular,
                  fontWeight: FontWeight.w700),
            ),
            new TextSpan(
              text: optional == null ? "" : lang.tr(optional),
              style: TextStyle(
                  color: Color(0xff5E5E5E),
                  fontSize: 12,
                  fontFamily: Family.regular,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      )

//     Text(
//       txt,
// //      textAlign: TextAlign.center,
//       style: TextStyle(
//           color: Color(0xff5E5E5E")),
//           fontSize: 15,
//
//           fontFamily: Family.regular,
//           fontWeight: FontWeight.w700),
//     ).tr(),
      );
}

Widget mainText(String txt) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 12),
    child: Text(
      txt,
//      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppTheme.primaryColor,
          fontSize: 14,
          fontFamily: AppTheme.boldFont,
          fontWeight: FontWeight.w900),
    ).tr(),
  );
}

Widget descText(String txt) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 12),
    child: Text(
      txt,
//      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppTheme.secondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w700),
    ).tr(),
  );
}

Widget authDescText(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    child: Text(
      txt,
      // textAlign: TextAlign.center,
      style: TextStyle(
          color: AppTheme.mainTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w900),
    ).tr(),
  );
}

Widget servicePriceOfferText(BuildContext context, String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: Text(
      "${context.locale.languageCode == "en" ? "Required service price" : "سعر تنفيذ الخدمة المطلوبة"} $txt ${context.locale.languageCode == "en" ? "Riyal " : "ريال"}",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppTheme.mainTextColor,
          fontSize: 15,
          fontFamily: Family.bold,
          fontWeight: FontWeight.w900),
    ).tr(),
  );
}

// Widget priceText(String txt){
//   return   Padding(
//     padding: const EdgeInsets.only(right: 10,left: 10),
//     child: Text(
//       "$txt ${context.locale.languageCode =="en"?"Sar":"رس"}",
//       style: TextStyle(
//           color: AppTheme.priceColor,
//           fontSize: 16,
//           fontFamily: AppTheme.boldFont,
//           fontWeight: FontWeight.w900),
//     ),
//   );
// }
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
