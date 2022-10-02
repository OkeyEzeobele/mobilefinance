import 'dart:convert';

PersonalDetails personalDetailsJson(String str) =>
    PersonalDetails.fromJson(json.decode(str));

class PersonalDetails {
  PersonalDetails({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  PersonalDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['payload'] = payload!.toJson();
    return _data;
  }
}

class Payload {
  Payload({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.maritalStatus,
    required this.monthlyIncome,
    required this.bvn,
    required this.userId,
    required this.statementId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final String? firstName;
  late final String? middleName;
  late final String? lastName;
  late final String? gender;
  late final String? dob;
  late final String? maritalStatus;
  late final int? monthlyIncome;
  late final int? bvn;
  late final int? userId;
  late final String? statementId;
  late final String? createdAt;
  late final String? updatedAt;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    dob = json['dob'];
    maritalStatus = json['maritalStatus'];
    monthlyIncome = json['monthlyIncome'];
    bvn = json['bvn'];
    userId = json['userId'];
    statementId = json['statementId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['middleName'] = middleName;
    _data['lastName'] = lastName;
    _data['gender'] = gender;
    _data['dob'] = dob;
    _data['maritalStatus'] = maritalStatus;
    _data['monthlyIncome'] = monthlyIncome;
    _data['bvn'] = bvn;
    _data['userId'] = userId;
    _data['statementId'] = statementId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
