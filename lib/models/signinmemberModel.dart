class SignIn {
  String? id;
  String? code;
  String? name;
  String? gotra;
  String? gender;
  String? age;
  String? bloodGroup;
  String? dateOfBirth;
  String? mobile;
  String? email;
  String? address;
  String? firmName;
  String? officeAddress;
  String? occupation;
  String? occupationDetail;
  String? officeContact;
  String? image;
  String? nativePlace;
  String? birthPlace;
  String? dateOfJoin;
  String? socialGroup;
  int? status;
  String? barcode;
  String? password;
  String? qrcode;
  String? anniversary;
  String? fatherName;
  String? motherName;
  String? officeEmail;
  String? reference;
  String? specialAchievement;
  String? whyJoin;
  String? lifeMember;
  String? lifeId;
  String? aadharNo;
  String? token;
  String? membershipId;
  String? color;
  String? rfid;
  String? marrital;
  String? deviceType;
  String? proof;
  String? paymentStatus;
  String? paymentType;
  String? renewalStatus;
  String? validTill;
  String? otherGroup;
  String? renewMode;
  String? formStatus;
  String? referenceNo;
  String? memType;
  String? filled;
  String? added;
  String? fees;
  String? receiptNo;
  String? filledDate;
  String? panCard;

  SignIn(
      {this.id,
        this.code,
        this.name,
        this.gotra,
        this.gender,
        this.age,
        this.bloodGroup,
        this.dateOfBirth,
        this.mobile,
        this.email,
        this.address,
        this.firmName,
        this.officeAddress,
        this.occupation,
        this.occupationDetail,
        this.officeContact,
        this.image,
        this.nativePlace,
        this.birthPlace,
        this.dateOfJoin,
        this.socialGroup,
        this.status,
        this.barcode,
        this.password,
        this.qrcode,
        this.anniversary,
        this.fatherName,
        this.motherName,
        this.officeEmail,
        this.reference,
        this.specialAchievement,
        this.whyJoin,
        this.lifeMember,
        this.lifeId,
        this.aadharNo,
        this.token,
        this.membershipId,
        this.color,
        this.rfid,
        this.marrital,
        this.deviceType,
        this.proof,
        this.paymentStatus,
        this.paymentType,
        this.renewalStatus,
        this.validTill,
        this.otherGroup,
        this.renewMode,
        this.formStatus,
        this.referenceNo,
        this.memType,
        this.filled,
        this.added,
        this.fees,
        this.receiptNo,
        this.filledDate,
        this.panCard});

  SignIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    gotra = json['gotra'];
    gender = json['gender'];
    age = json['age'];
    bloodGroup = json['blood_group'];
    dateOfBirth = json['date_of_birth'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    firmName = json['firm_name'];
    officeAddress = json['office_address'];
    occupation = json['occupation'];
    occupationDetail = json['occupation_detail'];
    officeContact = json['office_contact'];
    image = json['image'];
    nativePlace = json['native_place'];
    birthPlace = json['birth_place'];
    dateOfJoin = json['date_of_join'];
    socialGroup = json['social_group'];
    status = json['status'];
    barcode = json['barcode'];
    password = json['password'];
    qrcode = json['qrcode'];
    anniversary = json['anniversary'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    officeEmail = json['office_email'];
    reference = json['reference'];
    specialAchievement = json['special_achievement'];
    whyJoin = json['why_join'];
    lifeMember = json['life_member'];
    lifeId = json['life_id'];
    aadharNo = json['aadhar_no'];
    token = json['token'];
    membershipId = json['membership_id'];
    color = json['color'];
    rfid = json['rfid'];
    marrital = json['marrital'];
    deviceType = json['device_type'];
    proof = json['proof'];
    paymentStatus = json['payment_status'];
    paymentType = json['payment_type'];
    renewalStatus = json['renewal_status'];
    validTill = json['valid_till'];
    otherGroup = json['other_group'];
    renewMode = json['renew_mode'];
    formStatus = json['form_status'];
    referenceNo = json['reference_no'];
    memType = json['mem_type'];
    filled = json['filled'];
    added = json['added'];
    fees = json['fees'];
    receiptNo = json['receipt_no'];
    filledDate = json['filled_date'];
    panCard = json['pan_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['gotra'] = this.gotra;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['blood_group'] = this.bloodGroup;
    data['date_of_birth'] = this.dateOfBirth;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['firm_name'] = this.firmName;
    data['office_address'] = this.officeAddress;
    data['occupation'] = this.occupation;
    data['occupation_detail'] = this.occupationDetail;
    data['office_contact'] = this.officeContact;
    data['image'] = this.image;
    data['native_place'] = this.nativePlace;
    data['birth_place'] = this.birthPlace;
    data['date_of_join'] = this.dateOfJoin;
    data['social_group'] = this.socialGroup;
    data['status'] = this.status;
    data['barcode'] = this.barcode;
    data['password'] = this.password;
    data['qrcode'] = this.qrcode;
    data['anniversary'] = this.anniversary;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['office_email'] = this.officeEmail;
    data['reference'] = this.reference;
    data['special_achievement'] = this.specialAchievement;
    data['why_join'] = this.whyJoin;
    data['life_member'] = this.lifeMember;
    data['life_id'] = this.lifeId;
    data['aadhar_no'] = this.aadharNo;
    data['token'] = this.token;
    data['membership_id'] = this.membershipId;
    data['color'] = this.color;
    data['rfid'] = this.rfid;
    data['marrital'] = this.marrital;
    data['device_type'] = this.deviceType;
    data['proof'] = this.proof;
    data['payment_status'] = this.paymentStatus;
    data['payment_type'] = this.paymentType;
    data['renewal_status'] = this.renewalStatus;
    data['valid_till'] = this.validTill;
    data['other_group'] = this.otherGroup;
    data['renew_mode'] = this.renewMode;
    data['form_status'] = this.formStatus;
    data['reference_no'] = this.referenceNo;
    data['mem_type'] = this.memType;
    data['filled'] = this.filled;
    data['added'] = this.added;
    data['fees'] = this.fees;
    data['receipt_no'] = this.receiptNo;
    data['filled_date'] = this.filledDate;
    data['pan_card'] = this.panCard;
    return data;
  }
}