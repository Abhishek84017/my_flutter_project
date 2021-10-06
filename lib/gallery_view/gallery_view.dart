import 'package:avt_yuwas/appbar.dart';
import 'package:avt_yuwas/models/get_event_gallary_model.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key, this.items = const [], this.currentIndex = 0})
      : super(key: key);
  final List<String>? items;
  final int? currentIndex;

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.currentIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Avt Yuwas'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.share), onPressed: _share),
              Text('${_index + 1} of ${widget.items?.length}'),
              IconButton(
                  icon: Icon(Icons.download_rounded),
                  onPressed: _downloadToLocal),
            ],
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  _index = index;
                });
              },
              controller: PageController(initialPage: _index),
              children: widget.items
                      ?.map((item) => new Image(
                            image: NetworkImage(
                                '${Urls.IMAGE_BASE_URL}${item}'),
                          ))
                      .toList() ??
                  List.empty(),
            ),
          ),
        ],
      ),
    );
  }

  void _share() async {
    var response =
        await Services.downloadFile('${widget.items?[_index]}');
    if (response != null) {
      Share.shareFiles([response.path]);
    } else {
      Fluttertoast.showToast(msg: 'Unable to share file');
    }
  }

  void _downloadToLocal() async {
    var response =
        await Services.downloadFile('${widget.items?[_index]}');
    if (response != null) {
      await response.create(recursive: true);
      Fluttertoast.showToast(msg: 'Downloaded successfully');
    } else {
      Fluttertoast.showToast(msg: 'Unable to download file');
    }
  }
}
