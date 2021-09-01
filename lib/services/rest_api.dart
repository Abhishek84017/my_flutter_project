import 'dart:convert';
import 'dart:io';
import 'package:avt_yuwas/models/menu_model.dart';
import 'package:avt_yuwas/models/signinguest.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class Services {
  static Future<Data<List<MenuModel>>> getMenus(String tableName) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.JSON, {'table': tableName});
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        var _menus = <MenuModel>[];
        if (jsonResponse['data'] != null) {
          jsonResponse['data'].forEach((v) {
            _menus.add(new MenuModel.fromJson(v));
          });
        }
        return Data(
            data: _menus, statusCode: 200, message: 'data fetcher succefully');
      }
      return Data();
    } on SocketException catch (_) {
      return Data();
    } catch (_) {
      print(_);
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

  static Future<Data<SignInGuestModel>> SignUpGeste(
      Map<String, dynamic> data) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.REGISTER_GUEST, data);
    print(uri);
    try {
      http.Response response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
            data: new SignInGuestModel.fromJson(jsonResponse),
            statusCode: 200,
            message: 'data fetcher succefully');
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }
}
