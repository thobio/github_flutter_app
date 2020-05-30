import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubflutterapp/model/followers.dart';
import 'package:githubflutterapp/provider/follower_provider.dart';
import 'package:githubflutterapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FollowingPage extends StatefulWidget {
  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  final bool isSearchButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    final _followingList = Provider.of<FollowerProvider>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
          trailing: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          middle: Text("Following")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 5.0,
                    ),
                  ]),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    _followingList.following[index].avatarUrl,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${_followingList.following[index].login}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          itemCount: _followingList.following.length,
        ),
      ),
    );
  }
}
