import 'package:list_tile/LoginView.dart';
import 'package:list_tile/RegisterView.dart';
import 'package:list_tile/result.dart';
import 'ListCandidate.dart';
// import 'Screens/Welcome/welcome_screen.dart';
import 'VoteScreen.dart';
import 'voting.dart';
import 'package:flutter/material.dart';
import 'homeView.dart';
import 'splashScreen.dart';
import 'LoginView.dart';
import 'RegisterView.dart';

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
        // "/": (context) => WelcomeScreen(),
        "/": (context) => SplashScreen(),
        "/myHome": (context) => MyHome(),
        "/list_candidate": (context) => ListCandidate(),
        "/vote": (context) => VoteScreen(),
        // "/welcome": (context) => WelcomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/result": (context) => VotingResultPage()
      },
    );
  }
}
