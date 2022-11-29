class FundRequest {
  FundRequest(
      {required this.cardId, required this.amount, required this.txref});
  late final int cardId;
  late final int amount;
  late final String txref;

  FundRequest.fromJson(Map<String, dynamic> json) {
    cardId = json['cardId'];
    amount = json['amount'];
    txref = json['txref'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardId'] = cardId;
    _data['amount'] = amount;
    _data['txref'] = txref;
    return _data;
  }
}
