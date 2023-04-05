import 'package:flutter/material.dart';
import 'candidate.dart';
import 'list_candidate.dart';
import 'vote_screen.dart';
import 'home_screen.dart';

void main() => runApp(EvotingApp());

class EvotingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evoting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/list_candidate': (context) => ListCandidateScreen(),
        '/vote': (context) {
          // Menyediakan nilai candidate yang sesuai
          final Candidate candidate =
              Candidate('1', 'John Doe', 'john_doe.jpg', 'Visi John Doe');
          return VoteScreen(candidate: candidate);
        },
      },
    );
  }
}
