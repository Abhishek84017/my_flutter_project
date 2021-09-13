class SignInGuestModel {
  int? id;
  int? status;
  int? otp;

  SignInGuestModel({this.id, this.status, this.otp});

  SignInGuestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['otp'] = this.otp;
    return data;
  }
}