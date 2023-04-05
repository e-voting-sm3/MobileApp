import 'package:flutter/material.dart';
import 'candidate.dart';

class DetailCandidateScreen extends StatelessWidget {
  final Candidate candidate;

  DetailCandidateScreen({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candidate.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/${candidate.image}'),
            ),
            SizedBox(height: 30.0),
            Text(
              candidate.name,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              candidate.visi,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
