import 'dart:convert';

EmployerDetails employmentDetailsJson(String str) =>
    EmployerDetails.fromJson(json.decode(str));
class EmployerDetails {
  EmployerDetails({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  EmployerDetails.fromJson(Map<String, dynamic> json){
    success = json['success']?? false;
    message = json['message'];
    payload =json['payload'] != null ? Payload.fromJson(json['payload']) : null;
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
    required this.userId,
    required this.profession,
    required this.organizationName,
    required this.yearsOnJob,
    required this.employerAddress,
    required this.city,
    required this.country,
    required this.monthlySalary,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final int? userId;
  late final String? profession;
  late final String? organizationName;
  late final String? yearsOnJob;
  late final String? employerAddress;
  late final String? city;
  late final String? country;
  late final int? monthlySalary;
  late final String? createdAt;
  late final String? updatedAt;

  Payload.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    profession = json['profession'];
    organizationName = json['organizationName'];
    yearsOnJob = json['yearsOnJob'];
    employerAddress = json['employerAddress'];
    city = json['city'];
    country = json['country'];
    monthlySalary = json['monthlySalary'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['profession'] = profession;
    _data['organizationName'] = organizationName;
    _data['yearsOnJob'] = yearsOnJob;
    _data['employerAddress'] = employerAddress;
    _data['city'] = city;
    _data['country'] = country;
    _data['monthlySalary'] = monthlySalary;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}