import 'package:flutter/material.dart';
import 'candidate.dart';
import 'list_candidate.dart';
import 'vote_screen.dart';
import 'home_screen.dart';

void main() => runApp(const EvotingApp());

class EvotingApp extends StatelessWidget {
  const EvotingApp({super.key});

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
        '/vote': (context) => VoteScreen(),
      },
    );
  }
}
