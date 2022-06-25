import 'dart:convert';

AccountDetails accountDetailsJson(String str) =>
    AccountDetails.fromJson(json.decode(str));

class AccountDetails {
  AccountDetails({
    required this.success,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final String message;
  late final Payload payload;

  AccountDetails.fromJson(Map<String, dynamic> json) {
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
    required this.details,
  });
  late final Details details;

  Payload.fromJson(Map<String, dynamic> json) {
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    return _data;
  }
}

class Details {
  Details({
    required this.accountNumber,
    required this.accountName,
    required this.bankCode,
    required this.bankName,
  });
  late final String accountNumber;
  late final String accountName;
  late final String bankCode;
  late final String bankName;

  Details.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    bankCode = json['bank_code'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['account_number'] = accountNumber;
    _data['account_name'] = accountName;
    _data['bank_code'] = bankCode;
    _data['bank_name'] = bankName;
    return _data;
  }
}
