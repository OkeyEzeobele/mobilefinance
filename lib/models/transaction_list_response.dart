import 'dart:convert';

TransactionlistResponse transactionlistResponseJson(String str) =>
    TransactionlistResponse.fromJson(json.decode(str));

class TransactionlistResponse {
  TransactionlistResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final List<Payload> payload;

  TransactionlistResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payload =
        List.from(json['payload']).map((e) => Payload.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['payload'] = payload.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Payload {
  Payload({
    required this.id,
    required this.userId,
    required this.amount,
    required this.status,
    required this.fee,
    this.extfee,
    required this.destination,
    required this.destId,
    required this.source,
    required this.sourceId,
    required this.txref,
    this.response,
    this.comment,
    this.narration,
    required this.createdAt,
    required this.updatedAt,
    this.sourceCif,
    this.acctNumber,
    this.recepient,
    this.type,
    this.bankCode,
    this.accountNumber,
    this.cifNumber,
    this.tenure,
  });
  late final int id;
  late final int userId;
  late final num amount;
  late final String status;
  late final int fee;
  late final dynamic extfee;
  late final String destination;
  late final int destId;
  late final String source;
  late final int sourceId;
  late final String txref;
  late final dynamic response;
  late final String? comment;
  late final dynamic narration;
  late final String createdAt;
  late final String updatedAt;
  late final dynamic sourceCif;
  late final dynamic acctNumber;
  late final dynamic recepient;
  late final dynamic type;
  late final dynamic bankCode;
  late final dynamic accountNumber;
  late final dynamic cifNumber;
  late final dynamic tenure;

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    amount = json['amount'];
    status = json['status'];
    fee = json['fee'];
    extfee = json['extfee'];
    destination = json['destination'];
    destId = json['destId'];
    source = json['source'];
    sourceId = json['sourceId'];
    txref = json['txref'];
    response = json['response'];
    comment = json['comment'];
    narration = json['narration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sourceCif = json['sourceCif'];
    acctNumber = json['accountNumber'];
    recepient = json['recepient'];
    type = json['type'];
    bankCode = json["bankCode"];
    accountNumber = json['accountNumber'];
    cifNumber = json['cifNumber'];
    tenure = json['tenure'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['amount'] = amount;
    _data['status'] = status;
    _data['fee'] = fee;
    _data['extfee'] = extfee;
    _data['destination'] = destination;
    _data['destId'] = destId;
    _data['source'] = source;
    _data['sourceId'] = sourceId;
    _data['txref'] = txref;
    _data['response'] = response;
    _data['comment'] = comment;
    _data['narration'] = narration;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['sourceCif'] = sourceCif;
    _data['acctNumber'] = acctNumber;
    _data['recepient'] = recepient;
    _data['type'] = type;
    _data['bankCode'] = bankCode;
    _data['accountNumber'] = accountNumber;
    _data['cifNumber'] = cifNumber;
    _data['tenure'] = tenure;
    return _data;
  }
}
