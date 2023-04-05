import 'package:flutter/material.dart';
import 'candidate.dart';

class DetailCandidateScreen extends StatelessWidget {
  final Candidate candidate;

  const DetailCandidateScreen({super.key, required this.candidate});

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
            const SizedBox(height: 30.0),
            Text(
              candidate.name,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              candidate.visi,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
