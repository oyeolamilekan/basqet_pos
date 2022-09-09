import 'package:basqet_pos/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/app_config.dart';
import 'pages/app_dial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppConfigService.navigatorKey,
      title: 'Basqet POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SpaceGrotesk",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "transaction_dial",
      routes: {
        "transaction_dial": (_) => const TransactionDial(),
      },
    );
  }
}
