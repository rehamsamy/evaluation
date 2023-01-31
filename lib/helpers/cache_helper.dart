import 'package:shared_preferences/shared_preferences.dart';

class Cachehelpers {
  static late SharedPreferences _preferences;
  static const deviceToken = 'device_token';
  static const unReadNotifications = 'un_read_notifications';
  static const userToken = 'token';
  static const userId = 'user_id';
  static const userType = 'user_type';
  static const cityName = 'city_name';
  static const cityId = 'city_id';
  static const userName = 'name';
  static const userImage = 'profile';
  static const userPhone = 'mobile';
  static const language = 'language';

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setDeviceToken(String token) async {
    await _preferences.setString(deviceToken, token);
  }

  static String getDeviceToken() {
    return _preferences.getString(deviceToken) ?? "";
  }

  static setNumOfUnReadNotifications(int number) async {
    await _preferences.setInt(unReadNotifications, number);
  }

  static int getNumOfUnReadNotifications() {
    return _preferences.getInt(unReadNotifications) ?? 0;
  }

  static setUserId(int id) async {
    await _preferences.setInt(userId, id);
  }

  static int getUserId() {
    return _preferences.getInt(userId) ?? 0;
  }

  static setUserType(String value) async {
    await _preferences.setString(userType, value);
  }

  static String getUserType() {
    return _preferences.getString(userType) ?? "";
  }

  static setCityName(String value) async {
    await _preferences.setString(cityName, value);
  }

  static String getCityName() {
    return _preferences.getString(cityName) ?? " ";
  }

  static setCityId(String value) async {
    await _preferences.setString(cityId, value);
  }

  static String getCityId() {
    return _preferences.getString(cityId) ?? " ";
  }

  static setUserToken(String token) async {
    await _preferences.setString(userToken, "Bearer $token");
  }

  static String getUserToken() {
    return _preferences.getString(userToken) ?? "";
  }

  static setLang(lang) async {
    await _preferences.setString(language, lang);
  }

  static String getLang() {
    return _preferences.getString(language) ?? "ar";
  }

  static setName(String name) async {
    await _preferences.setString(userName, name);
  }

  static String getName() {
    return _preferences.getString(userName) ?? "";
  }

  static setImage(String image) async {
    await _preferences.setString(userImage, image);
  }

  static String getImage() {
    return _preferences.getString(
          userImage,
        ) ??
        "";
  }

  static setPhone(String phone) async {
    await _preferences.setString(userPhone, phone);
  }

  static String getPhone() {
    return _preferences.getString(
          userPhone,
        ) ??
        "";
  }

  static remove() async {
    await _preferences.clear();
  }

  static removeId() async {
    await _preferences.remove(userId);
  }

  static removeUserToken() async {
    await _preferences.remove(userToken);
  }
}
