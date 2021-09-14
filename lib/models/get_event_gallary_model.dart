class EventGallaryModel {
  String? id;
  String? eventId;
  String? image;
  String? thumb;

  EventGallaryModel({this.id, this.eventId, this.image, this.thumb});

  EventGallaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    image = json['image'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    return data;
  }
}