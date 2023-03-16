import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey =
    'b19092347261eda94c896eb70eed7f3eb2001d2555c8034ccc911bbd46bb9cb7';
//const url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=CNY&tsyms=BTC,ETH,LTC';
//const url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinDataBTC {
  CoinDataBTC(this.url);
  final String url;
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var lastPrice = decodeData[selectedCurrency];
      return lastPrice;

    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
class CoinDataETH {
  CoinDataETH(this.url);
  final String url;
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var lastPrice = decodeData[selectedCurrency];
      return lastPrice;

    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
class CoinDataLTC {
  CoinDataLTC(this.url);
  final String url;
  Future getCoinData(String selectedCurrency) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      var lastPrice = decodeData[selectedCurrency];
      return lastPrice;

    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
// Uri  currencyUrl =Uri.https('$url=BTC&tsyms=USD');

//    Future<List<String>> getCoinData()async{
//      http.Response response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC&tsyms=USD#'),);
//      if(response.statusCode == 200){
//      var decodedData = jsonDecode(response.body);
//      var price = body ['BTC'];
//    }
//      else{print(response.statusCode);
//      }
//    }
//}

// Future getCoinData()async {
//   String requestURL ='$url=BTC&tsyms=USD';
//   http.Response response = await
//   http.get(Uri.parse(requestURL));
//   if(response.statusCode == 200){
//     var decodedData = jsonDecode(response.body);
//     var price = decodedData['BTC'];
//     return price;
//   } else {
//     print(response.statusCode);
//   }
// }
