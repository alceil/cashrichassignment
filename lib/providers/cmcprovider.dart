import 'dart:convert';

import 'package:cashrichassignment/models/cmcmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CmcProvider with ChangeNotifier {
  List<Cmcmodel> _cmcData = [];
  List<Cmcmodel> get cmcData => _cmcData;

  Future getData() async {
    // final String facebookFeedURL =
    //     dotenv.env['GRAPH_API_BASE_URL_WITH_FIELDS']! +
    //         dotenv.env['FACEBOOK_ACCESS_TOKEN']!;

    // if (facebookFeedURL.isEmpty) {
    //   debugPrint(
    //       'Facebook Feed URL is not found in .env file\n Needed - GRAPH_API_BASE_URL_WITH_FIELDS & FACEBOOK_ACCESS_TOKEN\n Check the .env file is there in the root directory');
    //   throw Exception('Facebook Feed URL is null');
    // }

    // final url = Uri.parse(facebookFeedURL);

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
    List<Cmcmodel> tempData = [];
    for (var entry in data.entries) {
      tempData.add(Cmcmodel.convert(entry.value));
    }
    _cmcData = tempData;
    print(tempData);
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
