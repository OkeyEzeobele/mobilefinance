import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:o3_cards/models/account_details.dart';
import 'package:o3_cards/models/banklist.dart';
import 'package:o3_cards/models/cardlistResponse.dart';
import 'package:o3_cards/models/config.dart';
import 'package:o3_cards/models/login_request.dart';
import 'package:o3_cards/models/login_response.dart';
import 'package:o3_cards/models/request_account_details.dart';
import 'package:o3_cards/services/shared_service.dart';

import '../models/topup_request.dart';
import '../models/topup_response.dart';
import '../models/transactionListResponse.dart';
import '../models/transfer_request.dart';
import '../models/transfer_response.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponse> login(
    LoginRequest model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.baseUrl, Config.authLogin);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        loginResponseJson(response.body),
      );
    }
    return loginResponseJson(response.body);
  }

  static Future<CardListResponse> userCards() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.fetchCards,
    ); //https for live, http for debug

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setCardDetails(
        cardListResponseJson(response.body),
      );
    }
    return cardListResponseJson(response.body);
  }

  static Future<int> externalTransactions() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.externalTransactions,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    return response.statusCode;
  }

  static Future<TransactionlistResponse> userTransactions() async {
    var loginDetails = await SharedService.loginDetails();
    var extResp = await externalTransactions();

    if (kDebugMode) {
      print('Response code for external transactions is $extResp');
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.transactions,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    // if (response.statusCode == 200 && extResp == 200) {
    //   await SharedService.setTxnList(
    //     transactionlistResponseJson(response.body),
    //   );
    // }
    if (response.statusCode == 200) {
      await SharedService.setTxnList(
        transactionlistResponseJson(response.body),
      );
    }
    return transactionlistResponseJson(response.body);
  }

  static Future<Banklist?> banklist() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.banklist,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setBankList(banklistJson(response.body));
      // if (kDebugMode) {
      //   print('Response body: ${response.body}');
      // }
    }
    return banklistJson(response.body);
  }

  static Future<AccountDetails?> accountDetails(
      RequestAccountDetails model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.transferAccountResolve,
    );

    final response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return accountDetailsJson(response.body);
  }

  static Future<TransferResponse> transfer(
    TransferRequest model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(Config.baseUrl, Config.transfer);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return transferResponseJson(response.body);
  }

  static Future<TopupResponse> topup(
    TopupRequest model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(Config.baseUrl, Config.requestTopupBudpay);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return topupResponseJson(response.body);
  }
}
