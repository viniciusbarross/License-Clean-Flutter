import 'package:flutter/material.dart';
import 'package:license/controller/loginController.dart';
import 'package:license/view/homepage.dart';
import 'package:license/view/loginpage.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginController(false))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'License',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Consumer<LoginController>(
          builder: (context, value, child) {
            return value.getLogado() ? HomePage() : LoginPage();
          },
        ));
  }
}
