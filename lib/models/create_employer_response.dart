import 'dart:convert';
CreateEmployerResponse createEmployerJson(String str) =>
    CreateEmployerResponse.fromJson(json.decode(str));

class CreateEmployerResponse {
  CreateEmployerResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  CreateEmployerResponse.fromJson(Map<String, dynamic> json) {
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
    required this.profession,
    required this.organizationName,
    required this.yearsOnJob,
    required this.employerAddress,
    required this.city,
    required this.country,
    required this.monthlySalary,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
  });
  late final int? id;
  late final String? profession;
  late final String? organizationName;
  late final int? yearsOnJob;
  late final String? employerAddress;
  late final String? city;
  late final String? country;
  late final int? monthlySalary;
  late final int? userId;
  late final String? updatedAt;
  late final String? createdAt;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profession = json['profession'];
    organizationName = json['organizationName'];
    yearsOnJob = json['yearsOnJob'];
    employerAddress = json['employerAddress'];
    city = json['city'];
    country = json['country'];
    monthlySalary = json['monthlySalary'];
    userId = json['userId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profession'] = profession;
    _data['organizationName'] = organizationName;
    _data['yearsOnJob'] = yearsOnJob;
    _data['employerAddress'] = employerAddress;
    _data['city'] = city;
    _data['country'] = country;
    _data['monthlySalary'] = monthlySalary;
    _data['userId'] = userId;
    _data['updatedAt'] = updatedAt;
    _data['createdAt'] = createdAt;
    return _data;
  }
}
