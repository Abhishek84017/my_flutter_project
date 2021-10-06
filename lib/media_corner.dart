import 'package:avt_yuwas/pageroute.dart';
import 'package:avt_yuwas/services/rest_api.dart';
import 'package:avt_yuwas/services/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/global.dart';
import 'gallery_view/gallery_view.dart';
import 'models/Media_corner_model.dart';

class Mediacorner extends StatefulWidget {
  @override
  _MediacornerState createState() => _MediacornerState();
}

class _MediacornerState extends State<Mediacorner> {
  List<MediacornerModel>? mediacornerdata = <MediacornerModel>[];

  @override
  void initState() {
    _fetchmediacorner();
    super.initState();
  }

  void _fetchmediacorner() async {
    var responce = await Services.mediacorner();
    if (responce.statusCode == 200) {
      mediacornerdata = responce.data!;
      setState(() {});
    } else {
      print(responce.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: (mediacornerdata?.length ?? 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: 1.w,
          childAspectRatio: (2 / 1.2),
        ),
        itemBuilder: (context, index) {
          var item = mediacornerdata![index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  RotationRoute(
                      Page: GalleryView(
                          items: mediacornerdata
                                  ?.map((e) => "${e.image}")
                                  .toList() ??
                              [],
                          currentIndex: index)));
            },
            child: FadeInImage.assetNetwork(
              placeholder: kimagelogo,
              image: '${Urls.IMAGE_BASE_URL}${item.image}',
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
