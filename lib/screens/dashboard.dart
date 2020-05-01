import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubflutterapp/screens/followers.dart';
import 'package:githubflutterapp/screens/following.dart';
import 'package:githubflutterapp/screens/profile.dart';

class DashBoardPage extends StatefulWidget {
  static const routerName = '/dashboard';

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int currentIndex = 0;

  var pages = [
    FollowingPage(),
    FollowersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.favorite : Icons.favorite_border,
            ),
            title: Text("Following"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            title: Text("Followers"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        activeColor: Color(0xFF65B76D),
        iconSize: 35,
      ),
    );
  }
}
