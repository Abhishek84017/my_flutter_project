class  MediacornerModel{
  String? id;
  String? image;
  String? thumb;
  String? datetime;

  MediacornerModel({this.id, this.image, this.thumb, this.datetime});

  MediacornerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    thumb = json['thumb'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> MediacornerModel = new Map<String, dynamic>();
    MediacornerModel['id'] = this.id;
    MediacornerModel['image'] = this.image;
    MediacornerModel['thumb'] = this.thumb;
    MediacornerModel['datetime'] = this.datetime;
    return MediacornerModel;
  }
}