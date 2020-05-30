import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubflutterapp/provider/user_provider.dart';
import 'package:githubflutterapp/screens/dashboard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  void displayDialog(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Try Again!"),
        content: new Text(
          error,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image.asset(
                'images/github_PNG20-1.png',
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 90.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _controller,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: false,
                    hintText: 'Enter Github Username',
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(
                height: 90.0,
              ),
              RaisedButton(
                padding:
                    EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    displayDialog("Please enter github username!");
                  } else {
                    userData
                        .isUserAvaliable(_controller.text)
                        .catchError((error) {
                      displayDialog(error.toString());
                    });
                    if (userData.currentUser != null) {
                      print("${userData.currentUser.login}");
                      Navigator.of(context).pushNamed(DashBoardPage.routerName);
                    }
                  }
                },
                child: Text(
                  'Get Follower',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                color: Color(0xFF65B76D),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
