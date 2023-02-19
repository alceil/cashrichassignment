import 'package:cashrichassignment/pages/HomePage.dart';
import 'package:cashrichassignment/providers/cmcprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
    /// [ dotenv ] is used to initialize the [ Dotenv ].
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
              ChangeNotifierProvider(create: (_) => CmcProvider()),
      ],
      child: MaterialApp(
        title: 'CoinRich',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

