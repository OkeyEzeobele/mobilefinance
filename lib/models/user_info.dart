import 'dart:convert';

UserInfo userInfoJson(String str) => UserInfo.fromJson(json.decode(str));

class UserInfo {
  UserInfo({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  UserInfo.fromJson(Map<String, dynamic> json) {
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
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.isVerified,
    required this.isBvnVerified,
    required this.isBlocked,
    required this.spin,
    required this.resetToken,
    required this.pushToken,
    required this.deviceId,
    required this.dob,
    required this.bvn,
    required this.bvnName,
    required this.bvnAddress,
    required this.bvnDob,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final String? fullName;
  late final String? email;
  late final String? password;
  late final String? phone;
  late final bool? isVerified;
  late final bool? isBvnVerified;
  late final bool? isBlocked;
  late final dynamic spin;
  late final String? resetToken;
  late final String? pushToken;
  late final String? deviceId;
  late final String? dob;
  late final dynamic bvn;
  late final dynamic bvnName;
  late final dynamic bvnAddress;
  late final dynamic bvnDob;
  late final String? createdAt;
  late final String? updatedAt;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    isVerified = json['isVerified'];
    isBvnVerified = json['isBvnVerified'];
    isBlocked = json['isBlocked'];
    spin = null;
    resetToken = json['resetToken'];
    pushToken = json['pushToken'];
    deviceId = json['deviceId'];
    dob = json['dob'];
    bvn = null;
    bvnName = null;
    bvnAddress = null;
    bvnDob = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['isVerified'] = isVerified;
    _data['isBvnVerified'] = isBvnVerified;
    _data['isBlocked'] = isBlocked;
    _data['spin'] = spin;
    _data['resetToken'] = resetToken;
    _data['pushToken'] = pushToken;
    _data['deviceId'] = deviceId;
    _data['dob'] = dob;
    _data['bvn'] = bvn;
    _data['bvnName'] = bvnName;
    _data['bvnAddress'] = bvnAddress;
    _data['bvnDob'] = bvnDob;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
