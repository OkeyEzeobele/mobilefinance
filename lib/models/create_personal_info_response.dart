import 'dart:convert';
PersonalDetailsResponse createPersonalDetailsJson(String str) =>
    PersonalDetailsResponse.fromJson(json.decode(str));


class PersonalDetailsResponse {
  PersonalDetailsResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  PersonalDetailsResponse.fromJson(Map<String, dynamic> json){
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
    required this.maritalStatus,
    required this.monthlyIncome,
    required this.dob,
    required this.bvn,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
  });
  late final int? id;
  late final String? firstName;
  late final String? middleName;
  late final String? lastName;
  late final String? gender;
  late final String? maritalStatus;
  late final int? monthlyIncome;
  late final String? dob;
  late final int? bvn;
  late final int? userId;
  late final String? updatedAt;
  late final String? createdAt;
  
  Payload.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    monthlyIncome = json['monthlyIncome'];
    dob = json['dob'];
    bvn = json['bvn'];
    userId = json['userId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['middleName'] = middleName;
    _data['lastName'] = lastName;
    _data['gender'] = gender;
    _data['maritalStatus'] = maritalStatus;
    _data['monthlyIncome'] = monthlyIncome;
    _data['dob'] = dob;
    _data['bvn'] = bvn;
    _data['userId'] = userId;
    _data['updatedAt'] = updatedAt;
    _data['createdAt'] = createdAt;
    return _data;
  }
}