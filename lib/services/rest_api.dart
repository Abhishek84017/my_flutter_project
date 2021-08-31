import 'dart:convert';
import 'package:avt_yuwas/services/urls.dart';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class Services {
  static Future<Data?> getMenus(String tableName) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.JSON, {'table': tableName});
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
            data: jsonResponse['data'],
            status: true,
            message: 'data fetcher succefully');
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }

  static Future<Data?> upcomingEvents(String tableName) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.UPCOMING_EVENTS);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
          data: jsonResponse['data'],
        );
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }

  static Future<Data?> pastEvents(String tableName) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.PAST_EVENTS);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
          data: jsonResponse['data'],
        );
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }

  static Future<Data?> SignUpGeste(String name, String email, String mobile) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.JSON,
        {'name': name, 'email': email, 'mobile': mobile});
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
            data: jsonResponse['data'],
            status: true,
            message: 'data fetcher succefully');
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }
}
