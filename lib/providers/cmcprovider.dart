import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CmcProvider with ChangeNotifier {



   Future getData() async {


    String _url =
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC';
    final getValue = await http.get(Uri.parse(_url), headers: {
      'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149 ',
    });

    debugPrint("buhahaha");
    final decodeData = json.decode(getValue.body);
    List test = [];
    Map data = decodeData['data'];


    data.entries.map((e) {
      test.add(e);
    });
for (var entry in data.entries) {
  print(entry.key);
  print(entry.value['name']);
}
    //     testMap.entries.map((e) {
    //   print(e);
    // });
    // print(test);

    // try {
    //   final response = await http.get(url);
    //   debugPrint('Response status code: ${response.statusCode}');

    //   if (response.statusCode == 200) {
    //     // _feedData = FacebookFeedModel.fromJson(json.decode(response.body));
    //     // debugPrint('Feed Data Length: ${_feedData.posts!.data!.length}');
    //     // debugPrint('Profile Holder Name: ${_feedData.name}');
    //     // debugPrint('Feed Data is accessed by the app');
    //     notifyListeners();
    //   } else {
    //     throw Exception("API Error");
    //   }
    // } catch (error) {
    //   debugPrint('Facebook Data Provider Error: $error');
    //   rethrow;
    // }
    }
}
