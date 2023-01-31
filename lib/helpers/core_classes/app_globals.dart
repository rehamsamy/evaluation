import 'dart:async';

/// Class to store runtime global settings.
class AppGlobals {
  factory AppGlobals() => instance;

  AppGlobals._();

  /// Singleton instance.
  static final AppGlobals instance = AppGlobals._();
  bool? isAuth;
  int? id;
  String? name, mobile, email, profile, token;
  // LocationDataModel? source;
  // LocationDataModel ?destination;
  // LocationDataModel ?initLocation;
  int? unReadNotifications = 0;
  String? totalPrice = "";

  // LocationDataModel ?currentLocation;
  StreamController<dynamic> unReadNotificationStreamController =
      StreamController.broadcast();
  void closeStream() {
    unReadNotificationStreamController.close();
  }
}
