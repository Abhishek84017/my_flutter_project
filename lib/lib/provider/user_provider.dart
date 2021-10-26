import 'dart:convert';
import 'package:avt_yuwas/constants/global.dart';
import 'package:avt_yuwas/models/signinmemberModel.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  Userdata? _userdata;

  String? get id => _userdata?.id;

  String? get code => _userdata?.code;

  String? get name => _userdata?.name;

  String? get gotra => _userdata?.gotra;

  String? get gender => _userdata?.gender;

  String? get age => _userdata?.age;

  String? get bloodGroup => _userdata?.bloodGroup;

  String? get dateOfBirth => _userdata?.dateOfBirth;

  String? get mobile => _userdata?.mobile;

  String? get email => _userdata?.email;

  String? get address => _userdata?.address;

  String? get firmName => _userdata?.firmName;

  String? get officeAddress => _userdata?.officeAddress;

  String? get occupation => _userdata?.occupation;

  String? get occupationDetail => _userdata?.occupationDetail;

  String? get officeContact => _userdata?.officeContact;

  String? get image => _userdata?.image;

  String? get nativePlace => _userdata?.nativePlace;

  String? get birthPlace => _userdata?.birthPlace;

  String? get dateOfJoin => _userdata?.dateOfJoin;

  String? get socialGroup => _userdata?.socialGroup;

  int? get status => _userdata?.status;

  String? get barcode => _userdata?.barcode;

  String? get password => _userdata?.password;

  String? get qrcode => _userdata?.qrcode;

  String? get anniversary => _userdata?.anniversary;

  String? get fatherName => _userdata?.fatherName;

  String? get motherName => _userdata?.motherName;

  String? get officeEmail => _userdata?.officeEmail;

  String? get reference => _userdata?.reference;

  String? get specialAchievement => _userdata?.specialAchievement;

  String? get whyJoin => _userdata?.whyJoin;

  String? get lifeMember => _userdata?.lifeMember;

  String? get lifeId => _userdata?.lifeId;

  String? get aadharNo => _userdata?.aadharNo;

  String? get token => _userdata?.token;

  String? get membershipId => _userdata?.membershipId;

  String? get color => _userdata?.color;

  String? get rfid => _userdata?.rfid;

  String? get marrital => _userdata?.marrital;

  String? get deviceType => _userdata?.deviceType;

  String? get proof => _userdata?.proof;

  String? get paymentStatus => _userdata?.paymentStatus;

  String? get paymentType => _userdata?.paymentType;

  String? get renewalStatus => _userdata?.renewalStatus;

  String? get validTill => _userdata?.validTill;

  String? get otherGroup => _userdata?.otherGroup;

  String? get renewMode => _userdata?.renewMode;

  String? get formStatus => _userdata?.formStatus;

  String? get referenceNo => _userdata?.referenceNo;

  String? get memType => _userdata?.memType;

  String? get filled => _userdata?.filled;

  String? get added => _userdata?.added;

  String? get fees => _userdata?.fees;

  String? get receiptNo => _userdata?.receiptNo;

  String? get filledDate => _userdata?.filledDate;

  String? get panCard => _userdata?.panCard;

  Userdata? get userdata => _userdata;

  set userdata(Userdata? userdata) {
    _userdata = userdata;
    notifyListeners();
  }

  void init() {
    var data = kSharedPreferences?.getString('userdata');
    if (data != null && data.isNotEmpty) {
      _userdata = Userdata.fromJson(jsonDecode(data));
    }
  }

  void sync() async {
    if (_userdata != null) {
      var response = await Services.SigninMember(<String, dynamic>{
        'username': _userdata?.mobile,
        'password': _userdata?.password,
        'token': _userdata?.token
      });
      if (response.statusCode == 200) {
        _userdata = response.data;
        kSharedPreferences?.setString(
            'userdata', jsonEncode(response.data?.toJson()));
      }
    }
  }
}
