import 'dart:convert';

TopupResponse topupResponseJson(String str) =>
    TopupResponse.fromJson(json.decode(str));

class TopupResponse {
  TopupResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload payload;

  TopupResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Payload {
  Payload({
    required this.txref,
    required this.fee,
    required this.amount,
    required this.authorizationUrl,
    required this.accessCode,
    required this.budpayRef,
  });
  late final String txref;
  late final String fee;
  late final String amount;
  late final String authorizationUrl;
  late final String accessCode;
  late final String budpayRef;

  Payload.fromJson(Map<String, dynamic> json) {
    txref = json['txref'];
    fee = json['fee'];
    amount = json['amount'];
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    budpayRef = json['budpay_ref'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['txref'] = txref;
    _data['fee'] = fee;
    _data['amount'] = amount;
    _data['authorization_url'] = authorizationUrl;
    _data['access_code'] = accessCode;
    _data['budpay_ref'] = budpayRef;
    return _data;
  }
}
