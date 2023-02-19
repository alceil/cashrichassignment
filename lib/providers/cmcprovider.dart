import 'dart:convert';

import 'package:cashrichassignment/models/cmcmodel.dart';
import 'package:cashrichassignment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CmcProvider with ChangeNotifier {
  List<Cmcmodel> _cmcData = [];
  List<Cmcmodel> get cmcData => _cmcData;

//Fetches data from the server
  Future getData() async {
    String url = '$cmcBaseUrl/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC';
    try {
          final response = await http.get(Uri.parse(url), headers: {
      'X-CMC_PRO_API_KEY': dotenv.env['CMC_API_KEY']!,
    });
      debugPrint('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
    final decodeData = json.decode(response.body);
    Map data = decodeData['data'];

    List<Cmcmodel> tempData = [];
    for (var entry in data.entries) {
      tempData.add(Cmcmodel.convert(entry.value));
    }
    _cmcData = tempData;
        notifyListeners();
      } else {
        throw Exception("API Error");
      }
    } catch (error) {
      debugPrint('Facebook Data Provider Error: $error');
      rethrow;
  }



  }
}
