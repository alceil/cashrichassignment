import 'package:cashrichassignment/models/cmcmodel.dart';
import 'package:cashrichassignment/providers/cmcprovider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> acessDataFromServer() async {
    await Provider.of<CmcProvider>(context, listen: false).getData();
  }

  @override
  void didChangeDependencies() {
    acessDataFromServer();
    super.didChangeDependencies();
  }
  

  @override
  void initState() {
        acessDataFromServer();
    // TODO: implement initState
    super.initState();
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
            Flexible(
              child: Consumer<CmcProvider>(
                builder: (ctx, data, _) => ListView.builder(
                    itemCount: data.cmcData.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("name");
                      print(data.cmcData[index].name);
                      return HomeCard(
                          name: data.cmcData[index].name,
                          cmcRank: data.cmcData[index].cmcRank,
                          price: data.cmcData[index].price,
                          percentageChange:
                              data.cmcData[index].percentageChange,
                          symbol: data.cmcData[index].symbol);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.name,
      required this.cmcRank,
      required this.price,
      required this.percentageChange,
      required this.symbol});

  final String? name;
  final String? symbol;
  final int? cmcRank;
  final double? price;
  final double? percentageChange;

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
                    name!,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.green),
                      SizedBox(width: 5),
                      Text('$percentageChange%',
                          style: TextStyle(color: Colors.white))
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
                      symbol!,
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
                      Text('Price:  \$$price',
                          style: TextStyle(color: Colors.white)),
                      Text('Rank: $cmcRank',
                          style: TextStyle(color: Colors.white)),
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
