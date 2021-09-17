import 'dart:convert';
import 'dart:io';
import 'package:avt_yuwas/models/get_event_gallary_model.dart';
import 'package:avt_yuwas/models/menu_model.dart';
import 'package:avt_yuwas/models/signinguest.dart';
import 'package:avt_yuwas/models/signinmemberModel.dart';
import 'package:avt_yuwas/models/upcoming_events.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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
        return Data(data: jsonResponse['data'], statusCode: 200);
      }
      return Data();
    } catch (_) {
      print(_);
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

  static Future<Data<SignInGuestModel>> SignUpGeste(Map<String, dynamic> data) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.REGISTER_GUEST, data);
    try {
      http.Response response = await http.get(uri);
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

  static Future<Data<SignIn>> SigninMember(Map<String, dynamic> data) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.REGISTER_MEMBER, data);
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return Data(
            data: new SignIn.fromJson(jsonResponse),
            statusCode: 200,
            message: 'data fetcher succefully');
      }
      return Data();
    } catch (_) {
      return Data();
    }
  }

  static Future<Data<List<UpcomingEventsmodel>>> UpcominEvent() async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.UPCOMING_EVENTS);

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        var _menus = <UpcomingEventsmodel>[];
        if (jsonResponse['data'] != null) {
          jsonResponse['data'].forEach((v) {
            _menus.add(new UpcomingEventsmodel.fromJson(v));
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

  static Future<Data<List<EventGallaryModel>>> geteventgallary(
      String eventid) async {
    Uri uri = Uri.https(Urls.BASE_URL, Urls.EVENT_GALLARY, {'event': eventid});
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        var _menus = <EventGallaryModel>[];
        if (jsonResponse['data'] != null) {
          jsonResponse['data'].forEach((v) {
            _menus.add(new EventGallaryModel.fromJson(v));
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

  static Future<File>? downloadFile(String url) async {
    Uri uri = Uri.https(Urls.BASE_URL, url);
    try {
      Directory tempDir = await getApplicationDocumentsDirectory();
      String tempPath = tempDir.path;
      final downloadedFile = File('$tempPath${url.split('/').last}');
      if (await downloadedFile.exists()) {
        return downloadedFile;
      }
      final http.Response response = await http.get(uri);
      if (response.contentLength == 0) {
        return Future.value(null);
      }
      File file = new File('$tempPath${url.split('/').last}');
      await file.writeAsBytes(response.bodyBytes);
      return file;
    } catch (e) {
      return Future.value(null);
    }
  }
}
