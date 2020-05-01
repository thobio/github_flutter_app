import 'package:flutter/material.dart';
import 'package:githubflutterapp/screens/dashboard.dart';
import 'package:githubflutterapp/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.grey),
      home: DashBoardPage(),
      routes: {
        //DashBoardPage.routerName: (context) => DashBoardPage(),
      },
    );
  }
}
