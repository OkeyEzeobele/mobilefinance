// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:o3_cards/models/cardlist.dart';
import 'package:o3_cards/models/login_response.dart';
import 'package:o3_cards/models/transaction_list_response.dart';
import 'package:o3_cards/pages/signin/loginscreen2.dart';
import 'package:o3_cards/ui/export.dart';

import '../models/banklist.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(
      'login_details',
    );
    return isKeyExist;
  }

  static Future<bool> isCardsSaved() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(
      'card_list',
    );
    return isKeyExist;
  }
  static Future<bool> isTxnsSaved() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(
      'txn_list',
    );
    return isKeyExist;
  }
  static Future<bool> isBanksSaved() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist(
      'bank_list',
    );
    return isKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('login_details');

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<CardListResponse?> cardDetails() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist('card_list');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('card_list');

      return cardListResponseJson(cacheData.syncData);
    }
  }
  static Future<TransactionlistResponse?> txnList() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist('txn_list');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('txn_list');

      return transactionlistResponseJson(cacheData.syncData);
    }
  }
  static Future<Banklist?> bankList() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist('bank_list');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('bank_list');

      return banklistJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(
    LoginResponse model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'login_details',
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> setCardDetails(
    CardListResponse model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'card_list',
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> setTxnList(
    TransactionlistResponse model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'txn_list',
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> setBankList(
    Banklist model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'bank_list',
      syncData: jsonEncode(
        model.toJson(),
      ),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> softlogout(BuildContext context) async {
    await APICacheManager().deleteCache(
      'card_list',
    );
    await APICacheManager().deleteCache(
      'txn_list',
    );
    await APICacheManager().deleteCache(
      'bank_list',
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Loginscreen2(),
      ),
    );
  }

  static Future<void> hardlogout(BuildContext context) async {
    await APICacheManager().deleteCache(
      'login_details',
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Loginscreen(),
      ),
    );
  }
}
