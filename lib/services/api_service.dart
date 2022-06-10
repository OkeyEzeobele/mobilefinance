import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:o3_cards/models/config.dart';
import 'package:o3_cards/models/loginRequest.dart';
import 'package:o3_cards/models/loginResponse.dart';
import 'package:o3_cards/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponse> login(
    LoginRequest model,
    ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.authLogin
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {

      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return loginResponseJson(
      response.body
    );
  }

}
