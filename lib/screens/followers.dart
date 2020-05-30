import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubflutterapp/provider/follower_provider.dart';
import 'package:githubflutterapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FollowersPage extends StatefulWidget {
  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  final bool isSearchButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    final _followersList = Provider.of<FollowerProvider>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchAllList(),
              );
            }),
        middle: Text("Followers"),
      ),
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
              //color: Colors.white30,
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
                    _followersList.followers[index].avatarUrl,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${_followersList.followers[index].login}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          itemCount: _followersList.followers.length,
        ),
      ),
    );
  }
}

class SearchAllList extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {}

  @override
  Widget buildLeading(BuildContext context) {}
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
