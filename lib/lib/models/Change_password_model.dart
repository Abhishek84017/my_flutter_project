class ChangePasswordModel {
  int? status;
  String? password;
  ChangePasswordModel({this.status, this.password});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['password'] = this.password;
    return data;
  }
}