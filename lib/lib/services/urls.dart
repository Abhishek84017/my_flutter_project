import 'dart:convert';

import 'package:avt_yuwas/constants/global.dart';

class Urls {
  // apps base url
  static const String BASE_URL = 'www.avtyuwas.org';
  static const String UPCOMING_EVENTS = '/json/get_upcoming_events';
  // apps base url
  static const String IMAGE_BASE_URL = 'https://$BASE_URL/';

  // get tables details
  static const String JSON = '/json';

  // get tables details

  static const String PAST_EVENTS= '/json/get_past_events';

  static const String REGISTER_GUEST= '/json/register_guests';

  static const String REGISTER_MEMBER= '/json/check_logins';


  static const String EVENT_GALLARY= '/json/get_event_galleries';

  static const String CHANGE_PASSWORD= '/json/change_passwords';

  static const String URL_FOR_QR = '/json/markEventAttendance/';

  static const String MEDIA_CORNER = '/Json/get_media_corner';

  static const String ADD_SELFIE = '/Json/add_selfie';

  static const String FORGET_PASSWORD = '/Json/forget_password/';


}