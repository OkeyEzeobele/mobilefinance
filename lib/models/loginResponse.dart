// ignore_for_file: file_names
import 'dart:convert';

LoginResponse loginResponseJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
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
    required this.user,
    required this.token,
    required this.isVerified,
    required this.isBvnVerified,
    required this.cf,
    required this.password,
  });
  late final User? user;
  late final String? token;
  late final bool? isVerified;
  late final bool? isBvnVerified;
  late final Cf? cf;
  late final String? password;

  Payload.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']): null;
    token = json['token'];
    isVerified = json['isVerified'];
    isBvnVerified = json['isBvnVerified'];
    cf = json['cf'] != null ? Cf.fromJson(json['cf']): null;
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.toJson();
    _data['token'] = token;
    _data['isVerified'] = isVerified;
    _data['isBvnVerified'] = isBvnVerified;
    _data['cf'] = cf!.toJson();
    _data['password'] = password;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.fullName,
  });
  late final int id;
  late final String fullName;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullName'] = fullName;
    return _data;
  }
}

class Cf {
  Cf({
    required this.lct,
  });
  late final String lct;

  Cf.fromJson(Map<String, dynamic> json) {
    lct = json['lct'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lct'] = lct;
    return _data;
  }
}
