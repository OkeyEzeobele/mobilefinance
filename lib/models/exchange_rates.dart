import 'dart:convert';

ExchangeRates exchangeRatesJson(String str) =>
    ExchangeRates.fromJson(json.decode(str));

class ExchangeRates {
  ExchangeRates({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload payload;

  ExchangeRates.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
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
    required this.currency,
    required this.rate,
  });
  late final String currency;
  late final int rate;

  Payload.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currency'] = currency;
    _data['rate'] = rate;
    return _data;
  }
}
