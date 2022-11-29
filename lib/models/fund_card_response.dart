import 'dart:convert';

FundResponse fundResponseJson(String str) =>
    FundResponse.fromJson(json.decode(str));

class FundResponse {
  FundResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  FundResponse.fromJson(Map<String, dynamic> json) {
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

    required userId,
    required amount,
    required status,
    required cardId,
  });

  late final dynamic userId;
  late final dynamic amount;
  late final dynamic status;
  late final dynamic cardId;

  Payload.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    amount = json['amount'];
    status = json['status'];
    cardId = json['cardId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['status'] = status;
    _data['cardId'] = cardId;
    return _data;
  }
}
