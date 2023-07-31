import 'dart:convert';

import 'package:streamlivr/src/helper/export.dart';
import 'package:streamlivr/src/services/crypto_services.dart';

import '../models/crypto.dart';
import '../models/currencies_model.dart';

class WalletProvider extends ChangeNotifier {
  var currency = <CurrenciesModel>[
    CurrenciesModel(src: Assets.assetsIconsLskWallet, title: "LSK"),
    CurrenciesModel(src: Assets.assetsIconsToroWallet, title: "TORO"),
    CurrenciesModel(src: Assets.assetsIconsUsdtWallet, title: "USDT"),
    CurrenciesModel(src: Assets.assetsIconsNearWallet, title: "NEAR"),
  ];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasData = false;
  bool get hasData => _hasData;
  Crypto? _model;
  final List<CurrenciesModel> _currencies = [];
  List<CurrenciesModel>? get currencies => _currencies;
  Crypto? get model => _model;

  fetchBalance({
    required String address,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      await CryptoService.getCurrentBalance(address: address).then((value) {
        if (value.status == "success") {
          _isLoading = false;
          _hasData = true;
          _model = Crypto.fromJson(jsonDecode(value.data));
          notifyListeners();
        } else {
          _isLoading = false;
          _hasData = false;
          notifyListeners();
        }
      });
    } catch (e) {
     
      _isLoading = false;
      _hasData = false;
      notifyListeners();
    }
  }

  fetchData() async {
    for (var i = 0; i < currency.length; i++) {
      try {
        var respsonse = await CryptoService.convertCurrency(
            currency: currency[i].title.toString());
        if (respsonse.status == "success") {
          _currencies.add(
            CurrenciesModel(
              title: currency[i].title,
              src: currency[i].src,
              rate: jsonDecode(respsonse.data!.data)['rate'].toString(),
            ),
          );
          notifyListeners();
        } else {
          _currencies.add(
            CurrenciesModel(
              title: currency[i].title,
              src: currency[i].src,
              rate: "",
            ),
          );
          notifyListeners();
        }
      } catch (e) {
        _currencies.add(
          CurrenciesModel(
            title: currency[i].title,
            src: currency[i].src,
            rate: "",
          ),
        );
        notifyListeners();
       
      }
      await Future.delayed(const Duration(seconds: 3));
    }
  }
}
