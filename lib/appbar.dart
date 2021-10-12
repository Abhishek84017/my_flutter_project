import 'package:avt_yuwas/constants/global.dart';
import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:avt_yuwas/constants/palette.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'more_webview.dart';

AppBar appBar<T>(
    {required BuildContext context,
    String title = '',
    List<Widget>? actions,
    ShapeBorder? shape,
    Widget? leading,
    bool? centerTitle,
    Color? backgroundColor,
    double? elevation,
    Color? leadingColor,
    Widget? titleWidget,
    VoidCallback? onBackPressed,
    TextStyle? titleStyle,
    T? popData,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true}) {
  if (automaticallyImplyLeading) {
    leading = IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: onBackPressed ??
            () async {
              FocusScope.of(context).unfocus();
              await Navigator.maybePop<T>(context, popData);
            },
        color: Colors.white,
        iconSize: 24.0.sp);
  }
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      var responce = await Services.QrDataModel('$barcodeScanRes');
      if (responce?.statusCode == 200) {
        Fluttertoast.showToast(
            msg: '${responce?.data}', backgroundColor: Colors.red);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  var isguest = kSharedPreferences?.getString('data');

  if (isguest != null) {
    return AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor ?? Palette.appbarcolor,
        title: title != null && title.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 0.05.sw),
                child: Text(
                  '$title',
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)
                      .merge(titleStyle),
                ),
              )
            : titleWidget,
        actions: [
          IconButton(
              onPressed: scanBarcodeNormal,
              icon: Icon(
                Icons.qr_code_scanner,
                size: 24.sp,
              )),
          IconButton(
              onPressed: () => _notification(context),
              icon: Icon(
                Icons.notifications,
                size: 24.sp,
              ))
        ],
        shape: shape ?? null,
        leading: leading,
        elevation: elevation ?? 2.0,
        centerTitle: centerTitle ?? false,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: leadingColor ?? Colors.white, size: 20),
        bottom: bottom);
  } else {
    return AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor ?? Palette.appbarcolor,
        title: title != null && title.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 0.05.sw),
                child: Text(
                  '$title',
                  style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)
                      .merge(titleStyle),
                ),
              )
            : titleWidget,
        actions: [
          IconButton(
              onPressed: () => _notification(context),
              icon: Icon(
                Icons.notifications,
                size: 24.sp,
              ))
        ],
        shape: shape ?? null,
        leading: leading,
        elevation: elevation ?? 2.0,
        centerTitle: centerTitle ?? false,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: leadingColor ?? Colors.white, size: 20),
        bottom: bottom);
  }
}

void _notification(BuildContext context) async {
  Navigator.push(
      context,
      RotationRoute(
          Page: MoreWebview(
        url: 'http://avtyuwas.org/web/updates',
        title: 'Notification',
      )));
}
