import 'dart:convert';

TransferResponse transferResponseJson(String str) =>
    TransferResponse.fromJson(json.decode(str));

class TransferResponse {
  TransferResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload? payload;

  TransferResponse.fromJson(Map<String, dynamic> json){
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
  Payload();
  Payload.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}