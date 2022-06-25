import 'dart:convert';

RequestAccountDetails requestAccountDetailsJson(String str) =>
    RequestAccountDetails.fromJson(json.decode(str));

class RequestAccountDetails {
  RequestAccountDetails({
    required this.bankCode,
    required this.accountNumber,
  });
  late final String bankCode;
  late final String accountNumber;

  RequestAccountDetails.fromJson(Map<String, dynamic> json) {
    bankCode = json['bank_code'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bank_code'] = bankCode;
    _data['account_number'] = accountNumber;
    return _data;
  }
}
