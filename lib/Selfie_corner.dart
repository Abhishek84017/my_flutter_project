import 'dart:io';
import 'package:avt_yuwas/constants/global.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SelfieCorner extends StatefulWidget {
  @override
  _SelfieCornerState createState() => _SelfieCornerState();
}

class _SelfieCornerState extends State<SelfieCorner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Selfie corner'),
            backgroundColor: Color(0xFFF0233ad),
            actions: [
          IconButton(
              onPressed: _selectimage,
              icon: Icon(
                Icons.add,
                size: 24.sp,
              ))
        ]));
  }

  Future<void> _selectimage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFFF0233ad),
        builder: (builder) => Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                    child: Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        final file = File(image.path);
                        final response = await Services.addSelfie(
                            file, '${kUserProvider?.id}');
                        if (response.statusCode == 200) {
                          Fluttertoast.showToast(msg: '${response.message}');
                        }
                        print(response.message);
                      }
                    },
                  )),
                  Expanded(
                      child: TextButton(
                    child: Icon(Icons.camera, color: Colors.white),
                    onPressed: () async {


                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        final file = File(photo.path);
                        final response = await Services.addSelfie(
                            file, '${kUserProvider?.id}');
                        if (response.statusCode == 200) {
                          Fluttertoast.showToast(msg: '${response.message}');
                        }
                      }
                    },
                  )),
                ],
              ),
            ));
  }
}
