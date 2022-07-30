class TopupRequest {
  TopupRequest({
    required this.email,
    required this.amount,
    required this.equivalentAmount,
    required this.cardId,
    required this.currency,
  });
  late final String email;
  late final String amount;
  late final String equivalentAmount;
  late final int cardId;
  late final String currency;

  TopupRequest.fromJson(Map<String, dynamic> json){
    email = json['email'];
    amount = json['amount'];
    equivalentAmount = json['equivalentAmount'];
    cardId = json['cardId'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['amount'] = amount;
    _data['equivalentAmount'] = equivalentAmount;
    _data['cardId'] = cardId;
    _data['currency'] = currency;
    return _data;
  }
}