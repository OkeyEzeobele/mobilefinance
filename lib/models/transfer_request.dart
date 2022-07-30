import 'dart:convert';

TransferRequest transferRequestJson(String str) => TransferRequest.fromJson(json.decode(str));

class TransferRequest {
  TransferRequest({
    required this.amount,
    required this.pin,
    required this.recepient,
    required this.cardId,
    required this.cifNumber,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.narration,
  });
  late final int amount;
  late final String pin;
  late final String recepient;
  late final int cardId;
  late final String cifNumber;
  late final String bankCode;
  late final String bankName;
  late final String accountNumber;
  late final String narration;

  TransferRequest.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    pin = json['pin'];
    recepient = json['recepient'];
    cardId = json['cardId'];
    cifNumber = json['cifNumber'];
    bankCode = json['bankCode'];
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    narration = json['narration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['pin'] = pin;
    _data['recepient'] = recepient;
    _data['cardId'] = cardId;
    _data['cifNumber'] = cifNumber;
    _data['bankCode'] = bankCode;
    _data['bankName'] = bankName;
    _data['accountNumber'] = accountNumber;
    _data['narration'] = narration;
    return _data;
  }
}