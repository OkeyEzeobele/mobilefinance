import 'dart:convert';

CardListResponse cardListResponseJson(String str) =>
    CardListResponse.fromJson(json.decode(str));


class CardListResponse {
  CardListResponse({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final List<Payload> payload;

  CardListResponse.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.first6,
    required this.last4,
    required this.cardHash,
    required this.cifNumber,
    required this.appNumber,
    required this.acctNumber,
    required this.orderLabel,
    required this.balance,
    required this.virtual,
    required this.type,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String first6;
  late final String last4;
  late final String cardHash;
  late final String cifNumber;
  late final dynamic appNumber;
  late final String acctNumber;
  late final dynamic orderLabel;
  late final dynamic balance;
  late final bool virtual;
  late final String type;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  Payload.fromJson(Map<String, dynamic> json){
    id = json['id'];
    first6 = json['first6'];
    last4 = json['last4'];
    cardHash = json['cardHash'];
    cifNumber = json['cifNumber'];
    appNumber = json['appNumber'];
    acctNumber = json['acctNumber'];
    orderLabel = json['orderLabel'];
    balance = json['balance'];
    virtual = json['virtual'];
    type = json['type'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first6'] = first6;
    _data['last4'] = last4;
    _data['cardHash'] = cardHash;
    _data['cifNumber'] = cifNumber;
    _data['appNumber'] = appNumber;
    _data['acctNumber'] = acctNumber;
    _data['orderLabel'] = orderLabel;
    _data['balance'] = balance;
    _data['virtual'] = virtual;
    _data['type'] = type;
    _data['userId'] = userId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}