class UpcomingEventsmodel {
  String? image;
  String? title;
  String? date;
  int? id;
  int? maxAge;
  int? minAge;
  int? applyStatus;
  int? shortDescription;
  int? longDescription;

  UpcomingEventsmodel(
      {this.image,
        this.title,
        this.date,
        this.id,
        this.maxAge,
        this.minAge,
        this.applyStatus,
        this.shortDescription,
        this.longDescription});

  UpcomingEventsmodel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    date = json['date'];
    id = json['id'];
    maxAge = json['max_age'];
    minAge = json['min_age'];
    applyStatus = json['apply_status'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['date'] = this.date;
    data['id'] = this.id;
    data['max_age'] = this.maxAge;
    data['min_age'] = this.minAge;
    data['apply_status'] = this.applyStatus;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    return data;
  }
}