import 'dart:convert';

SignupResponse signupResponseJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

class SignupResponse {
  SignupResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
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
    required this.email,
    required this.fullName,
    required this.token,
    required this.isVerified,
    required this.pinToken,
  });
  late final int? id;
  late final String? email;
  late final String? fullName;
  late final String? token;
  late final bool? isVerified;
  late final String? pinToken;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    token = json['token'];
    isVerified = json['isVerified'];
    pinToken = json['pinToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['fullName'] = fullName;
    _data['token'] = token;
    _data['isVerified'] = isVerified;
    _data['pinToken'] = pinToken;
    return _data;
  }
}
