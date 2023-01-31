
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:evaluation/helpers/core_classes/app_globals.dart';
import 'package:evaluation/main.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../generated/locale_keys.g.dart';
import '../core_classes/app_theme.dart';

TextStyle _textStyle = TextStyle(
    color: AppTheme.appBarTextColor, fontSize: 13, fontWeight: FontWeight.w700);
AppBar appBar(BuildContext context, String title,
    {Widget? action,bool leading =true}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppTheme.appBarColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    flexibleSpace: _flexibleSpace(),
    actions: [action ?? Container()],
    leading: leading ? _leadingIcon(context) : Container(),
    title: Text(title, style: _textStyle).tr(),
  );
}

Widget _leadingIcon(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: AppTheme.appBarColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Icon(
          Icons.arrow_back,
          color: AppTheme.appBarTextColor,
          size: 25,
        )),
      ),
    ),
  );
}

Widget separateAppBar(BuildContext context, String title, bool leading,
    {Widget? action}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Color(0xff4A154B),
    elevation: 0,
    automaticallyImplyLeading: false,
//    flexibleSpace: _flexibleSpace(),
    actions: [action ?? Container()],
    leading: leading ? _leadingIcon(context) : Container(),
    title: Text(title, style: _textStyle).tr(),
  );
}

// Widget providerHomeAppBar(
//   dynamic onSearchTapped,
// ) {
//   return AppBar(
//       centerTitle: true,
//       flexibleSpace: _flexibleSpace(),
//
// //      backgroundColor: AppTheme.primaryColor,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       actions: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: GestureDetector (
//             onTap: () {
//               Share.share(AppTheme.link);
//             },
//             child: Image.asset(
//               "assets/icons/share.png",
//               fit: BoxFit.contain,
//               color: Colors.white,
//               width: 20,
//               height: 30,
//             ),
//           ),
//         ),
//       ],
//       leading: Padding(
//         padding: const EdgeInsets.all(13.0),
//         child: Image.asset(
//           "assets/icons/search_btn.png",
//           fit: BoxFit.contain,
//           color: Colors.white,
//           width: 25,
//           height: 25,
//         ),
//       ),
//       title: Image.asset(
//         "assets/icons/logo.png",
//         fit: BoxFit.contain,
//         width: 90,
//         height: 60,
//       ));
// }

AppBar homeAppBar(dynamic onNotificationTapped, dynamic onDrawerTapped) {
  return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        onNotificationTapped == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: StreamBuilder(
                          stream: getIt
                              .get<AppGlobals>()
                              .unReadNotificationStreamController
                              .stream,
                          initialData: '',
                          builder: (context, snapshot) {
                            // return Text('${snapshot.data}');
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                snapshot.data == null || snapshot.data == 0
                                    ? ''
                                    : '${snapshot.data}',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.accentColor,
                                    fontWeight: FontWeight.w800),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: onNotificationTapped,
                        child: Image.asset(
                          "assets/icons/notification.png",
                          fit: BoxFit.contain,
                          // color: Colors.white,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: onDrawerTapped,
          child: Image.asset(
            "assets/icons/drawer.png",
            fit: BoxFit.contain,
            color: Colors.white,
            width: 25,
            height: 25,
          ),
        ),
      ),
      title: Image.asset(
        "assets/icons/logo.png",
        fit: BoxFit.contain,
        width: 90,
        // height: 50,
      ));
}

Widget appBarShareIcon(String url) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: GestureDetector(
      onTap: () {
        Share.share(url);
      },
      child: Image.asset(
        "assets/icons/share.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ),
    ),
  );
}

Widget appBarFilterIcon(dynamic onTap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          "assets/icons/filter.png",
          width: 30,
          height: 40,
        )),
  );
}

Widget emailConfirmationLeadingIcon(BuildContext context) {
  return IconButton(
      icon: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white, width: .5)),
          child: Icon(
            Icons.close_sharp,
            size: 18,
          )),
      onPressed: () {
        Navigator.of(context).pop();
        // Get.back();
      });
}

Widget _flexibleSpace() {
  return Container(
      decoration: BoxDecoration(color: AppTheme.appBarColor
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         stops: [
          //   0.5,
          //   1.0
          // ],
          //         colors: <Color>[
          //   Color(0xff3B132D),
          //   Color(0xff240B1B),
          // ])
          ));
}

class MainAppBar extends StatelessWidget {
  final String? title;
  final bool? leading;
  final Widget? action;
  final bool? isSwap;

  const MainAppBar(
    this.title,
    this.leading, {
    this.action,
    this.isSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "MainAppBar",
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/appbar.png"), fit: BoxFit.fill)
            // color: Colors.transparent,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading!
                ? IconButton(
                    icon: Icon(
                      // Platform.isAndroid ? Icons.arrow_back :
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppTheme.appBarTextColor,
                    ),
                    onPressed: () {
                      // isRouteToHome &&isRouteToHome !=null ? Get.offAllNamed(Routes.HomeView) : Get.back();
                      Navigator.of(context).pop();
                      // Get.back();
                    })
                : isSwap == null
                    ? Container(
                        width: 20,
                      )
                    : action!,
            Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    title!,
                    style: TextStyle(
                      color: AppTheme.appBarTextColor,
                      fontSize: 20,
                      fontFamily: Family.bold,
                    ),
                  ).tr(),
                ),
              ),
            ),
            action == null || isSwap != null
                ? Container(
                    width: 30,
                  )
                : action!
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;

  final Widget action;
  final Widget leading;

  const CustomAppBar(
    this.title,
    this.leading,
    this.action,
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "MainAppBar",
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/appbar.png"), fit: BoxFit.fill)
            // color: Colors.transparent,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading,
            Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.appBarTextColor,
                      fontSize: 20,
                      fontFamily: Family.bold,
                    ),
                  ).tr(),
                ),
              ),
            ),
            action == null
                ? Container(
                    width: 30,
                  )
                : action
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  final dynamic onNotificationTapped, onDrawerTapped;

  const HomeAppBar(
    this.onNotificationTapped,
    this.onDrawerTapped,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/icons/appbar.png"), fit: BoxFit.fill)
          // color: Colors.transparent,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onDrawerTapped,
              child: Image.asset(
                "assets/icons/drawer.png",
                width: 20,
                height: 20,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Center(
                child: Text(
                  LocaleKeys.BottomNavigation_Home,
                  style: TextStyle(
                    color: AppTheme.appBarTextColor,
                    fontSize: 20,
                    fontFamily: Family.bold,
                  ),
                ).tr(),
              ),
            ),
          ),
          GestureDetector(
              onTap: onNotificationTapped,
              child: Image.asset(
                "assets/icons/notifications.png",
                width: 20,
                height: 20,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

Widget drawerIcon(dynamic onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "assets/icons/drawer.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ));
}

Widget addIcon(dynamic onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "assets/icons/add.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ));
}

Widget editIcon(dynamic onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "assets/icons/edit.png",
        width: 20,
        height: 20,
        color: Colors.white,
      ));
}
