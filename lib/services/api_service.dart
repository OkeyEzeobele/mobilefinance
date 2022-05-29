import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:o3_cards/widgets/constants.dart';
import 'package:o3_cards/pages/loginscreen/model.dart';

class ApiService {
  Future<List<Login>?> login() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.login);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Login> _model = loginFromJson(response.body) as List<Login>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
