import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VotingResultPage extends StatefulWidget {
  @override
  _VotingResultPageState createState() => _VotingResultPageState();
}

class _VotingResultPageState extends State<VotingResultPage> {
  List<Map<String, dynamic>> candidates = [];
  String token = '';

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://voting.surabayawebtech.com/api/auth/votes'),
        headers: {'Authorization': 'Bearer $token'},
      );
      final responseData = json.decode(response.body);
      final message = responseData['message'];

      if (message == 'success') {
        final data = responseData['data'];

        setState(() {
          candidates = List<Map<String, dynamic>>.from(data);
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Harap Tunggu'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/myHome');
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 230, 250),
        appBar: AppBar(
          backgroundColor: Color(0xff5E64FD),
          title: Text('Result Vote'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              resultCircular(),
              resultLinear(),
            ],
          ),
        ),
      ),
    );
  }

  Widget resultCircular() {
  if (candidates.isEmpty) {
    return Center(child: CircularProgressIndicator());
  } else {
    // Mengurutkan kandidat berdasarkan persentase secara menurun
    candidates.sort((a, b) => b['percentage'].compareTo(a['percentage']));

    final topCandidate = candidates[0];
    final percentage = double.parse(topCandidate['percentage']) / 100;
    final isTopCandidate = candidates.length > 1 && percentage > 0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 3,
        shape: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(20),
          child: CircularPercentIndicator(
            radius: 110.0,
            lineWidth: 15.0,
            percent: percentage,
            animation: true,
            animationDuration: 1500,
            center: new Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 20,
                color: isTopCandidate ? Colors.pink : Colors.black,
              ),
            ),
            progressColor: isTopCandidate ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }
}


  Widget resultLinear() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        final candidate = candidates[index];
        final name = candidate['name'];
        final percentage = double.parse(candidate['percentage']) / 100;
        final isTopCandidate = index == 0;

        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: isTopCandidate
                ? RichText(
                    text: TextSpan(
                      text: name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  )
                : Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  ),
            trailing: Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: isTopCandidate
                  ? TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    )
                  : TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
            ),
          ),
        );
      },
    ),
  );
}
}
