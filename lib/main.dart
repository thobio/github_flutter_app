import 'package:flutter/material.dart';
import 'package:githubflutterapp/provider/follower_provider.dart';
import 'package:githubflutterapp/screens/dashboard.dart';
import 'package:githubflutterapp/screens/home_page.dart';
import 'provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProxyProvider<UserProvider, FollowerProvider>(
          create: (BuildContext context) => FollowerProvider(null),
          update: (context, auth, previousMessages) => FollowerProvider(auth),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.grey),
        home: HomePage(),
        routes: {
          DashBoardPage.routerName: (context) => DashBoardPage(),
        },
      ),
    );
  }
}
