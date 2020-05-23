import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowersPage extends StatelessWidget {
  final bool isSearchButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          trailing: IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context:context ,delegate:SearchAllList(),);
          }),
          middle: Text("Followers"),),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: Column(
              children: [
                Image.network(
                  "https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png",
                  height: 150,
                  width: 150,
                ),
                Text("Hello")
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}

class SearchAllList extends SearchDelegate <String> {
  @override
  List<Widget> buildActions(BuildContext context) {
  
    }
  
   @override
  Widget buildLeading(BuildContext context) {
   
  }
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