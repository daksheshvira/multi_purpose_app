import 'dart:convert';

import 'package:http/http.dart';
import 'package:multi_purpose_app/utils/strings.dart';

class HttpService {
  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> makeGetRequest(String url, [String param = '']) async {
    if (param.isNotEmpty) {
      url = url + param;
    }
    print(url);
    var response = await get(Uri.parse(url), headers: headers);
    return await responseData(response);
  }

  Future<dynamic> makePostRequest(String url, dynamic payload) async {
    var response = await post(Uri.parse(url), headers: headers, body: payload);
    return await responseData(response);
  }

  Future<dynamic> responseData(Response response) async {
    var responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
      case 206:
        return responseJson;
      case 404:
        throw Exception(Strings.instance.notFound);
      case 500:
      case 503:
        throw Exception(Strings.instance.serverError);
      default:
        throw Exception(Strings.instance.somethingWrong);
    }
  }
}
