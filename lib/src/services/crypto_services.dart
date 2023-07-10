import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class CryptoService {
  static Future<ResponseModel> convertCurrency(
      {required String currency}) async {
    try {
      var response = await http.get(
        Uri.parse("https://rest.coinapi.io/v1/exchangerate/USD/$currency"),
        headers: {"X-CoinAPI-Key": "EA52CABA-71F6-42E4-BCEB-C052B6133118"},
      );
      print(response.body);
      if (response.statusCode.toString()[0] == "2") {
        return ResponseModel(data: response.body, status: "success");
      } else {
        return ResponseModel(data: response.body, status: "error");
      }
    } catch (e) {
      print(e);
      return ResponseModel(data: e, status: "error");
    }
  }

  static Future<ResponseModel> getCurrentBalance(
      {required String address}) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://service.lisk.com/api/v2/accounts?address=lskjschf4aov8t9dp3aeaokvk99txz9webvu3egc4"),
      );
      if (response.statusCode.toString()[0] == "2") {
        return ResponseModel(data: response.body, status: "success");
      } else {
        return ResponseModel(data: response.body, status: "error");
      }
    } catch (e) {
      print(e);
      return ResponseModel(data: e, status: "error");
    }
  }
}
