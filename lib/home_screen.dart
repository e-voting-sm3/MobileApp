import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list_candidate');
              },
              child: Text('Candidate'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vote');
              },
              child: Text('Vote'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/result');
              },
              child: Text('Result'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(150.0, 50.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
