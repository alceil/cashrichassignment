import 'package:cashrichassignment/models/cmcmodel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

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
      print(entry.key);
      print(entry.value['name']);
      tempData.add(Cmcmodel.convert(entry.value));
    }
    print(tempData[0].name);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363333),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Align(
            child: Text(
          'CoinRich',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.pie_chart_outline,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Show Chart',
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                  Text(
                    'Count:5',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            HomeCard()
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required});
  // final String name;
  // final String rank;
  // final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cardano',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.green),
                      SizedBox(width: 5),
                      Text('54%', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Container(
                    width: 80,
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF363333),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Align(
                        child: Text(
                      'ADA',
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price:  \$123',
                          style: TextStyle(color: Colors.white)),
                      Text('Rank: 7', style: TextStyle(color: Colors.white)),
                      CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
