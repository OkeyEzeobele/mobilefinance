import 'dart:convert';
import 'package:o3_cards/services/BaseAPI.dart';
import 'package:http/http.dart' as http;

class AuthAPI extends BaseAPI {

  // Future<http.Response> signUp(String name, String email, String phone,
  //     String password, String passwordConfirmation) async {
  //   var body = jsonEncode({
  //     'customer': {
  //       'name': name,
  //       'email': email,
  //       'phone': phone,
  //       'password': password,
  //       'password_confirmation': passwordConfirmation
  //     }
  //   });

  //   http.Response response =
  //       await http.post(super.customersPath, headers: super.headers, body: body);
  //   return response;
  // }

  Future<http.Response> login(String email, String password) async {
    var body = jsonEncode({
      'email': email,
      'password': password
    });

    http.Response response =
        await http.post(
          Uri.parse(super.loginPath),
          headers: super.headers,
          body: body
        );

    return response;
  }


  // Future<http.Response> logout(int id, String token) async {
  //   var body = jsonEncode({'id': id, 'token': token});

  //   http.Response response = await http.post(super.logoutPath,
  //       headers: super.headers, body: body);

  //   return response;
  // }

}