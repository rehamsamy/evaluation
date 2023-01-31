import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';

import '../core_classes/app_theme.dart';

const OutlineInputBorder _border = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(12),
  ),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.none,
  ),
);

// filled: true,
// focusColor: AppTheme.primaryColor,
// fillColor: Colors.transparent,
//
OutlineInputBorder _enabledBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(15)),
  borderSide: BorderSide(width: .6, color: AppTheme.secondaryColor),
);

TextStyle _errorStyle = const TextStyle(
  fontFamily: AppTheme.fontName,
  color: Colors.red,
  fontSize: 14,
);

TextStyle _labelStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: Family.regular,
  fontSize: 13,
  color: AppTheme.mainTextColor,
  backgroundColor: Colors.transparent,
);
OutlineInputBorder _errorBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(15)),
  borderSide: BorderSide(width: .4, color: AppTheme.secondaryColor),
);

OutlineInputBorder _focusedErrorBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(15)),
  borderSide: BorderSide(width: .4, color: AppTheme.secondaryColor),
);

EdgeInsetsGeometry _contentPadding = const EdgeInsets.only(
  left: 15,
  right: 15,
// top: 15,
  bottom: 10,
);
Widget txtField(BuildContext? context, onChanged, dynamic validator,
    {String? labelText,
    TextInputType? textInputType,
    bool? obscureText,
    bool? enable,
    TextEditingController? controller,
    int? maxLines,
    Color? nonNullColor,
    double? widthRatio,
    String? img,
    String? prefix,
    String? suffix,
    dynamic onTap,
    bool? isContact,
    bool? isHint}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20),
    child: GestureDetector(
      onTap: onTap,
      child: TextFormField(
        validator: validator,
        textAlign: TextAlign.start,
        // textDirection: context.locale.languageCode == "en"
        //     ? TextDirection.ltr
        //     : TextDirection.rtl,
        controller: controller,
        onChanged: onChanged, enabled: enable ?? true,
//      textAlign: TextAlign.center,

        keyboardType: textInputType ?? TextInputType.text,
//      autofocus: true,
        cursorColor: AppTheme.primaryColor,
        keyboardAppearance: Brightness.dark,
        enableSuggestions: true,
        obscureText: obscureText ?? false, maxLines: maxLines ?? 1,
        style: TextStyle(
            fontFamily: AppTheme.fontName,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
        decoration: InputDecoration(
          contentPadding: _contentPadding,
          focusColor: AppTheme.primaryColor,
          fillColor: Colors.transparent,
          enabledBorder: isContact == null || !isContact
              ? _enabledBorder
              : OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(width: 1, color: AppTheme.accentColor),
                ),
          errorStyle: _errorStyle,
          border: isContact == null || !isContact
              ? _border
              : OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(width: 1, color: AppTheme.accentColor),
                ),
          // errorStyle: _errorStyle,
          filled: true,
          enabled: true,
          alignLabelWithHint: true,
          labelStyle: _labelStyle,

          labelText:
              isHint != null && isHint == true ? null : lang.tr(labelText!),
          hintText:
              isHint != null && isHint == true ? lang.tr(labelText!) : null,

          // labelText == null ? "" : labelText.tr(),
          hintStyle: _labelStyle,

          suffixIconConstraints:
              // suffix == null
              //     ? BoxConstraints.expand(width: 10, height: 2)
              //     :
              const BoxConstraints.expand(width: 35, height: 35),
          suffixIcon: suffix == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: suffix == "arrow_down" ? 12 : 6,
                    horizontal: suffix == "arrow_down" ? 12 : 8,
                  ),
                  child: Image.asset(
                    "assets/icons/$suffix.png",
                    width: 20,
                    height: 20,
                  ),
                ),
          prefixIconConstraints: prefix == null
              ? const BoxConstraints.expand(width: 15, height: 2)
              : const BoxConstraints.expand(width: 35, height: 35),
          prefixIcon: prefix == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: prefix == "arrow_down" ? 12 : 6,
                    horizontal: prefix == "arrow_down" ? 12 : 8,
                  ),
                  child: Image.asset(
                    "assets/icons/$prefix.png",
                    width: 20,
                    height: 20,
                  ),
                ),
        ),
        // prefixIconConstraints: img == null
        //     ? BoxConstraints.expand(width: 10, height: 2)
        //     : BoxConstraints.expand(width: 35, height: 35),
        // prefixIcon: img == null
        //     ? Container()
        //     : Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Image.asset(
        //           "assets/icons/$img.png",
        //           width: 20,
        //           height: 20,
        //         ),
        //       ),
      ),
    ),
  );
}

Widget addPriceTextField(
  BuildContext context,
  onChanged,
) {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      textAlign: TextAlign.start,
      // textDirection: context.locale.languageCode == "en"
      //     ? TextDirection.ltr
      //     : TextDirection.rtl,
      onChanged: onChanged,
//      textAlign: TextAlign.center,

      keyboardType: TextInputType.number,
//      autofocus: true,
      cursorColor: AppTheme.primaryColor,
      keyboardAppearance: Brightness.dark,
      enableSuggestions: true,
      obscureText: false, maxLines: 1,
      style: TextStyle(
          fontFamily: AppTheme.fontName,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 15),
      decoration: InputDecoration(
        contentPadding: _contentPadding,
        focusColor: AppTheme.primaryColor,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(width: 1, color: AppTheme.accentColor),
        ),
        errorStyle: _errorStyle,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(width: 1, color: AppTheme.accentColor),
        ),
        // errorStyle: _errorStyle,
        filled: true,
        enabled: true,
        alignLabelWithHint: true,
        labelStyle: _labelStyle,
        labelText:
            context.locale.languageCode == "en" ? "Put price" : "أكتب المبلغ",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600, fontFamily: Family.regular,
          fontSize: 15,
          color: Color(0xffD9D9D9),

          // fontWeight: FontWeight.w600,
        ),
        // suffixIconConstraints:
        //     // suffix == null
        //     //     ? BoxConstraints.expand(width: 10, height: 2)
        //     //     :
        //     const BoxConstraints.expand(width: 35, height: 35),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Text(context.locale.languageCode == "en" ? "Sar" : "رس"),
        ),
      ),
      // prefixIconConstraints: img == null
      //     ? BoxConstraints.expand(width: 10, height: 2)
      //     : BoxConstraints.expand(width: 35, height: 35),
      // prefixIcon: img == null
      //     ? Container()
      //     : Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset(
      //           "assets/icons/$img.png",
      //           width: 20,
      //           height: 20,
      //         ),
      //       ),
    ),
  );
}

Widget textFormField(
    {BuildContext? context,
    validator,
    dynamic onChanged,
    String? labelText,
    int? maxLines,
    bool? obscureText,
    TextInputType? textInputType,
    bool? enable,
    dynamic prefix,
    dynamic suffix,
    TextEditingController? controller,
    double? padding,
    bool? isHint}) {
  return Padding(
    padding: EdgeInsets.only(right: padding ?? 25, left: padding ?? 25),
    child: TextFormField(
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      enabled: enable ?? true,
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(
          fontFamily: AppTheme.fontName,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 15,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          focusColor: AppTheme.primaryColor,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: .6, color: AppTheme.secondaryColor),
          ),
          errorStyle: const TextStyle(
            fontFamily: AppTheme.fontName,
            color: Colors.red,
            fontSize: 14,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: .4, color: AppTheme.secondaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: .4, color: AppTheme.secondaryColor),
          ),

          // OutlineInputBorder(
          //
          //   borderRadius: BorderRadius.all(Radius.circular(15)),
          //   borderSide: BorderSide(
          //     width: .2,
          //     // style: BorderStyle.none,
          //     color: AppTheme.secondaryColor
          //   ),
          // ),

          enabled: true,
          labelText:
              isHint != null && isHint == true ? null : lang.tr(labelText!),
          prefixIcon: suffix == null
              ? null
              : suffix is String
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: suffix == "down" ? 18 : 12.0),
                      child: Image.asset(
                        "assets/icons/$suffix.png",
                        width: suffix == "down" ? 10 : 20,
                        height: suffix == "down" ? 10 : 20,
                      ),
                    )
                  : suffix,
          hintText: isHint != null && isHint == true ? labelText : null,
          suffixIcon: prefix == null
              ? null
              : prefix is String
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: prefix == "down" ? 18 : 12.0),
                      child: Image.asset(
                        "assets/icons/$prefix.png",
                        width: prefix == "down" ? 10 : 20,
                        height: prefix == "down" ? 10 : 20,
                        color: AppTheme.primaryColor,
                      ),
                    )
                  : prefix,
          alignLabelWithHint: true,
          labelStyle: _labelStyle,
          hintStyle: _labelStyle),
    ),
  );
}
//
// Widget selectServiceTextField(BuildContext? context, dynamic onChanged,
//     TextEditingController controller, bool? enabled) {
//   return TextFormField(
//     // validator: validator,
//     // textAlign: TextAlign.start,
//     // textDirection: context.locale.languageCode == "en"
//     //     ? TextDirection.ltr
//     //     : TextDirection.rtl,
//     controller: controller,
//     onChanged: onChanged, enabled: true,
//     textAlign: TextAlign.center,
//
//     keyboardType: TextInputType.number,
// //      autofocus: true,
//     cursorColor: AppTheme.primaryColor,
//     keyboardAppearance: Brightness.dark,
//     enableSuggestions: true,
//     obscureText: false, maxLines: 1,
//     style: TextStyle(
//         fontFamily: AppTheme.fontName,
//         color: Color(0xff5C5A5A")),
//         // AppTheme.primaryColor,
//         fontWeight: FontWeight.bold,
//         fontSize: 15),
//     decoration: InputDecoration(
//       errorStyle: TextStyle(
//         fontFamily: AppTheme.fontName,
//         color: Colors.red,
//         fontSize: 13,
//       ),
//       contentPadding: EdgeInsets.only(
//         left: 15,
//         right: 15,
//         // top: 15,
//         bottom: 10,
//       ),
//       focusColor: AppTheme.primaryColor,
//       fillColor: Colors.transparent,
//
//       enabledBorder: OutlineInputBorder(
//         borderRadius: const BorderRadius.all(Radius.circular(15)),
//         borderSide: BorderSide(width: .6, color: AppTheme.secondaryColor),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(12),
//         ),
//         borderSide: BorderSide(
//           width: 0,
//           style: BorderStyle.none,
//         ),
//       ),
//       filled: true,
//
//       enabled: true,
//       alignLabelWithHint: true,
//       // labelStyle: TextStyle(
//       //   fontWeight: FontWeight.w600,
//       //   fontFamily: Family.regular,
//       //   fontSize: 15,
//       //   color: Color(0xffDBDBDB")),
//       //   backgroundColor: Colors.transparent,
//       // ),
//     ),
//   );
// }
//

SizedBox sizedBox() {
  return const SizedBox(height: AppTheme.sizedBoxHeight);
}

Widget reportFormField({
  BuildContext? context,
  dynamic onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25, left: 25),
    child: TextFormField(
      onChanged: onChanged,
      maxLines: 3,
      style: TextStyle(
          fontFamily: AppTheme.fontName,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 15),
      decoration: InputDecoration(
        errorStyle: AppTheme.validateTextStyle,
        contentPadding: const EdgeInsets.all(15),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabled: true,
        hintText: context!.locale.languageCode == "en"
            ? "Write your problem here ....."
            : "هنا يكتب وصف المشكلة ...",
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: AppTheme.secondaryColor,
          fontWeight: FontWeight.w600,
          backgroundColor: Colors.transparent,
          fontSize: 12,
        ),
      ),
    ),
  );
}

Widget acceptOrderFormField({
  BuildContext? context,
  dynamic onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25, left: 25),
    child: TextFormField(
      onChanged: onChanged,
      maxLines: 3,
      style: TextStyle(
          fontFamily: AppTheme.fontName,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 15),
      decoration: InputDecoration(
        errorStyle: AppTheme.validateTextStyle,
        contentPadding:
            EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabled: true,
        hintText: context!.locale.languageCode == "en"
            ? "Write your price here ....."
            : "هنا يكتب وصف السعر ...",
        alignLabelWithHint: true,
        hintStyle: TextStyle(
          color: AppTheme.secondaryColor,
          fontWeight: FontWeight.w600,
          backgroundColor: Colors.transparent,
          fontSize: 12,
        ),
      ),
    ),
  );
}
