import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:o3_cards/models/account_details.dart';
import 'package:o3_cards/models/banklist.dart';
import 'package:o3_cards/models/cardlist.dart';
import 'package:o3_cards/models/config.dart';
import 'package:o3_cards/models/create_employer_response.dart';
import 'package:o3_cards/models/employment_details.dart';
import 'package:o3_cards/models/exchange_rates.dart';
import 'package:o3_cards/models/fund_card_request.dart';
import 'package:o3_cards/models/login_request.dart';
import 'package:o3_cards/models/login_response.dart';
import 'package:o3_cards/models/mono_auth_request.dart';
import 'package:o3_cards/models/rate_request.dart';
import 'package:o3_cards/models/request_account_details.dart';
import 'package:o3_cards/services/shared_service.dart';

import '../models/create_employer_request.dart';
import '../models/create_personal_info_request.dart';
import '../models/create_personal_info_response.dart';
import '../models/fund_card_response.dart';
import '../models/mono_auth_response.dart';
import '../models/personal_details.dart';
import '../models/profile_image.dart';
import '../models/signup_request.dart';
import '../models/signup_response.dart';
import '../models/topup_request.dart';
import '../models/topup_response.dart';
import '../models/transaction_list_response.dart';
import '../models/transfer_request.dart';
import '../models/transfer_response.dart';
import '../models/user_info.dart';

class APIService {
  static var client = http.Client();
  static const urlHeader = Uri.https;

  static Future<SignupResponse> signup(
    SignupRequest model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = urlHeader(Config.baseUrl, Config.authRegister);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return signupResponseJson(response.body);
  }

  static Future<LoginResponse> login(
    LoginRequest model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = urlHeader(Config.baseUrl, Config.authLogin);

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

    var url = urlHeader(
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

    var url = urlHeader(
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

    var url = urlHeader(
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

    var url = urlHeader(
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

    var url = urlHeader(
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

    var url = urlHeader(Config.baseUrl, Config.transfer);

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

    var url = urlHeader(Config.baseUrl, Config.requestTopupBudpay);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return topupResponseJson(response.body);
  }

  static Future<ExchangeRates> rates(RateRequest model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(Config.baseUrl, Config.getRates);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return exchangeRatesJson(response.body);
  }

  static Future<CreateEmployerResponse> createEmployer(
    CreateEmployerRequest model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(Config.baseUrl, Config.profileCreateEmployer);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    if (response.statusCode == 200) {
      await getEmploymentDetails();
    }
    return createEmployerJson(response.body);
  }

  static Future<EmployerDetails> getEmploymentDetails() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(
      Config.baseUrl,
      Config.profileGetEmployer,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setEmploymentDetails(
        employmentDetailsJson(response.body),
      );
    }
    return employmentDetailsJson(response.body);
  }

  static Future<PersonalDetailsResponse> createPersonalDetails(
    PersonalDetailsRequest model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(Config.baseUrl, Config.profileCreatePersonal);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    if (response.statusCode == 200) {
      await getPersonalDetails();
    }
    return createPersonalDetailsJson(response.body);
  }

  static Future<PersonalDetails> getPersonalDetails() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(
      Config.baseUrl,
      Config.profilePersonalDetails,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setPersonalDetails(
        personalDetailsJson(response.body),
      );
    }
    return personalDetailsJson(response.body);
  }

  static Future<UserInfo> getUserInfo() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(
      Config.baseUrl,
      Config.profileUserInfo,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setUserInfo(
        userInfoJson(response.body),
      );
    }
    return userInfoJson(response.body);
  }

  static Future<ProfileImage> getProfileImage() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(
      Config.baseUrl,
      Config.profilePicture,
    );

    final response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setProfileImage(
        profileImageJson(response.body),
      );
    }
    return profileImageJson(response.body);
  }

  static Future<MonoAuth> authenticateMono(RequestMonoAuth model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(Config.baseUrl, Config.monoAuth);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    return monoAuthJson(response.body);
  }

  static Future<FundResponse> fundCard(
    FundRequest model,
  ) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = urlHeader(Config.baseUrl, Config.fundCard);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );

    return fundResponseJson(response.body);
  }
}
