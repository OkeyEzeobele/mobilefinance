// ignore_for_file: file_names

class BaseAPI {
  static String baseUrl = 'https://api.o3virtual.com';
  static var api = baseUrl + "/api/v1";

  var loginPath = api + '/login';

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}

