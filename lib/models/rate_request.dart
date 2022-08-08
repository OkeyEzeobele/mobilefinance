class RateRequest {
  RateRequest({
    required this.currency,
  });
  late final String currency;

  RateRequest.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currency'] = currency;
    return _data;
  }
}
