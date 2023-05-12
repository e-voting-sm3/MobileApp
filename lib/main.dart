import 'ListCandidate.dart';
import 'VoteScreen.dart';
import 'voting.dart';
import 'package:flutter/material.dart';
import 'homeView.dart';
import 'splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ananda',
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "/myHome": (context) => MyHome(),
        "/list_candidate": (context) => ListCandidate(),
        "/vote": (context) => VoteScreen(),
      },
    );
  }
}
