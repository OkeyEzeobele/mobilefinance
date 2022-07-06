import 'dart:convert';

Banklist banklistJson(String str) =>
    Banklist.fromJson(json.decode(str));


class Banklist {
  Banklist({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final List<Payload> payload;

  Banklist.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    payload = List.from(json['payload']).map((e)=>Payload.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['payload'] = payload.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Payload {
  Payload({
    required this.bankName,
    required this.bankCode,
  });
  late final String bankName;
  late final String bankCode;

  Payload.fromJson(Map<String, dynamic> json){
    bankName = json['bank_name'];
    bankCode = json['bank_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bank_name'] = bankName;
    _data['bank_code'] = bankCode;
    return _data;
  }
}