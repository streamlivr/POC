import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class CryptoService {
  static Future<ResponseModel> fetchData({required String currency}) async {
    try {
      var response = await http.get(
        Uri.parse("https://rest.coinapi.io/v1/exchangerate/$currency/USD"),
        headers: {"X-CoinAPI-Key": "EA52CABA-71F6-42E4-BCEB-C052B6133118"},
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


