class EventsModel {
  String? id;
  String? title;
  String? date;
  String? applyStatus;
  String? shortDescription;
  String? longDescription;
  String? minAge;
  String? maxAge;
  String? status;
  String? time;
  String? joiningFee;
  String? venue;
  String? jayantiStatus;
  String? closeDate;
  String? convenor;
  String? coConvenor;
  String? rules;
  String? eventType;
  String? noOfMember;
  String? inquiry;
  String? league;
  String? jayantiStatus2019;
  String? jayantiStatus2020;
  String? jayantiStatus2021;
  String? formStatus;
  String? eventDatetime;
  String? image;
  String? type;

  EventsModel(
      {this.id,
        this.title,
        this.date,
        this.applyStatus,
        this.shortDescription,
        this.longDescription,
        this.minAge,
        this.maxAge,
        this.status,
        this.time,
        this.joiningFee,
        this.venue,
        this.jayantiStatus,
        this.closeDate,
        this.convenor,
        this.coConvenor,
        this.rules,
        this.eventType,
        this.noOfMember,
        this.inquiry,
        this.league,
        this.jayantiStatus2019,
        this.jayantiStatus2020,
        this.jayantiStatus2021,
        this.formStatus,
        this.eventDatetime,
        this.image,
        this.type});

  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    applyStatus = json['apply_status'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    status = json['status'];
    time = json['time'];
    joiningFee = json['joining_fee'];
    venue = json['venue'];
    jayantiStatus = json['jayanti_status'];
    closeDate = json['close_date'];
    convenor = json['convenor'];
    coConvenor = json['co_convenor'];
    rules = json['rules'];
    eventType = json['event_type'];
    noOfMember = json['no_of_member'];
    inquiry = json['inquiry'];
    league = json['league'];
    jayantiStatus2019 = json['jayanti_status_2019'];
    jayantiStatus2020 = json['jayanti_status_2020'];
    jayantiStatus2021 = json['jayanti_status_2021'];
    formStatus = json['form_status'];
    eventDatetime = json['event_datetime'];
    image = json['image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['apply_status'] = this.applyStatus;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['min_age'] = this.minAge;
    data['max_age'] = this.maxAge;
    data['status'] = this.status;
    data['time'] = this.time;
    data['joining_fee'] = this.joiningFee;
    data['venue'] = this.venue;
    data['jayanti_status'] = this.jayantiStatus;
    data['close_date'] = this.closeDate;
    data['convenor'] = this.convenor;
    data['co_convenor'] = this.coConvenor;
    data['rules'] = this.rules;
    data['event_type'] = this.eventType;
    data['no_of_member'] = this.noOfMember;
    data['inquiry'] = this.inquiry;
    data['league'] = this.league;
    data['jayanti_status_2019'] = this.jayantiStatus2019;
    data['jayanti_status_2020'] = this.jayantiStatus2020;
    data['jayanti_status_2021'] = this.jayantiStatus2021;
    data['form_status'] = this.formStatus;
    data['event_datetime'] = this.eventDatetime;
    data['image'] = this.image;
    data['type'] = this.type;
    return data;
  }
}

class Event {
  String? id;
  String? title;
  String? date;
  String? applyStatus;
  String? shortDescription;
  String? longDescription;
  String? minAge;
  String? maxAge;
  String? status;
  String? time;
  String? joiningFee;
  String? venue;
  String? jayantiStatus;
  String? closeDate;
  String? convenor;
  String? coConvenor;
  String? rules;
  String? eventType;
  String? noOfMember;
  String? inquiry;
  String? league;
  String? jayantiStatus2019;
  String? jayantiStatus2020;
  String? jayantiStatus2021;
  String? formStatus;
  String? eventDatetime;
  String? image;

  Event(
      {this.id,
        this.title,
        this.date,
        this.applyStatus,
        this.shortDescription,
        this.longDescription,
        this.minAge,
        this.maxAge,
        this.status,
        this.time,
        this.joiningFee,
        this.venue,
        this.jayantiStatus,
        this.closeDate,
        this.convenor,
        this.coConvenor,
        this.rules,
        this.eventType,
        this.noOfMember,
        this.inquiry,
        this.league,
        this.jayantiStatus2019,
        this.jayantiStatus2020,
        this.jayantiStatus2021,
        this.formStatus,
        this.eventDatetime,
        this.image});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    applyStatus = json['apply_status'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    status = json['status'];
    time = json['time'];
    joiningFee = json['joining_fee'];
    venue = json['venue'];
    jayantiStatus = json['jayanti_status'];
    closeDate = json['close_date'];
    convenor = json['convenor'];
    coConvenor = json['co_convenor'];
    rules = json['rules'];
    eventType = json['event_type'];
    noOfMember = json['no_of_member'];
    inquiry = json['inquiry'];
    league = json['league'];
    jayantiStatus2019 = json['jayanti_status_2019'];
    jayantiStatus2020 = json['jayanti_status_2020'];
    jayantiStatus2021 = json['jayanti_status_2021'];
    formStatus = json['form_status'];
    eventDatetime = json['event_datetime'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['apply_status'] = this.applyStatus;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['min_age'] = this.minAge;
    data['max_age'] = this.maxAge;
    data['status'] = this.status;
    data['time'] = this.time;
    data['joining_fee'] = this.joiningFee;
    data['venue'] = this.venue;
    data['jayanti_status'] = this.jayantiStatus;
    data['close_date'] = this.closeDate;
    data['convenor'] = this.convenor;
    data['co_convenor'] = this.coConvenor;
    data['rules'] = this.rules;
    data['event_type'] = this.eventType;
    data['no_of_member'] = this.noOfMember;
    data['inquiry'] = this.inquiry;
    data['league'] = this.league;
    data['jayanti_status_2019'] = this.jayantiStatus2019;
    data['jayanti_status_2020'] = this.jayantiStatus2020;
    data['jayanti_status_2021'] = this.jayantiStatus2021;
    data['form_status'] = this.formStatus;
    data['event_datetime'] = this.eventDatetime;
    data['image'] = this.image;
    return data;
  }
}