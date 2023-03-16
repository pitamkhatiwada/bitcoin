import 'package:flutter/material.dart';
import 'package:bitcoin/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    getDataBTC();
    getDataETH();
    getDataLTC();
  }

  String selectedCurrency = 'AUD';

  DropdownButton<dynamic> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newitem);
    }

    return DropdownButton<dynamic>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(
          () {
            selectedCurrency = value!;
            getDataBTC();
            getDataETH();
            getDataLTC();
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerItem,
    );
  }

  String bitcoinUSD = '';
  String ethUSD = '';
  String ltcUSD = '';
  void getDataBTC() async {
    CoinDataBTC coinData = CoinDataBTC(
        'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=$selectedCurrency');
    try {
      num coiNdata = await coinData.getCoinData(selectedCurrency);
      setState(() {
        bitcoinUSD = coiNdata.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataETH() async {
    CoinDataBTC coinData = CoinDataBTC(
        'https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=$selectedCurrency');
    try {
      num coiNdata = await coinData.getCoinData(selectedCurrency);
      setState(() {
        ethUSD = coiNdata.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getDataLTC() async {
    CoinDataBTC coinData = CoinDataBTC(
        'https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=$selectedCurrency');
    try {
      num coiNdata = await coinData.getCoinData(selectedCurrency);
      setState(() {
        ltcUSD = coiNdata.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ethUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $ltcUSD $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 400,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }

  getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropDownButton();
    }
  }
}
// double usdValue = decodeData['USA'];
// double jpyValue = decodeData['JPY'];
//
// print(usdValue);
// print(jpyValue);
