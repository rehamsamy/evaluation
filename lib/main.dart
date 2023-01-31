
import 'package:easy_localization/easy_localization.dart';
import 'package:evaluation/helpers/cache_helper.dart';
import 'package:evaluation/helpers/codegen_loader.g.dart';
import 'package:evaluation/helpers/core_classes/app_globals.dart';
import 'package:evaluation/helpers/core_classes/server_gate.dart';
import 'package:evaluation/helpers/core_classes/themes.dart';
import 'package:evaluation/screens/auth/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'helpers/core_classes/bloc_observer.dart';
import 'helpers/custom_widgets/un_focus.dart';
import 'helpers/core_classes/kiwi.dart';


final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Cachehelpers.init();
  // FirebaseMessaging.instance.getToken().then((value) async {
  //   String? token = value;
  //   print(token);
  //   await Cachehelpers.setDeviceToken(token!);
  // });
  //  await ServerGate.init();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  initKiwi();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    BlocOverrides.runZoned(
          () {
        runApp(
          EasyLocalization(
            path: 'assets/translations',
            startLocale: const Locale('en', 'US'),
            fallbackLocale: const Locale('ar', 'SA'),
            saveLocale: true,
            supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
            assetLoader:  CodegenLoader(),
            child: ScreenUtilInit(
              builder: (context, child) => const MyApp(),
            ),
          ),
        );
      },
      blocObserver: MyBlocObserver(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      navigatorKey: navigator,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.light(),
      builder: (context, child) => UnFocus(
        child: child,
      ),
      themeMode: ThemeMode.light,
      home:  AuthView(),
    );
  }
}

void initServiceLocator() {
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());
}

GetIt getIt = GetIt.instance;

