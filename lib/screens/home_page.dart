import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
              onPressed: () {},
              child: Text(
                'Get Follower',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              color: Color(0xFF65B76D),
            ),
          ],
        ),
      ),
    );
  }
}
