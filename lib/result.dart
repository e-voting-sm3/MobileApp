import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        Uri.parse('http://voting.surabayawebtech.com/api/auth/votes'),
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
        appBar: AppBar(
            backgroundColor: Color(0xff5E64FD),
            title: Text('Hasil Voting'),
            centerTitle: true,
          ),
        body: Column(
          children: [
            Flexible(child: resultCircular(), flex: 1),
            Flexible(child: resultLinear(), flex: 2),
          ],
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

      return Column(
        children: [
          SizedBox(height: 15),
          Container(
            child: CircularPercentIndicator(
              radius: 110.0,
              lineWidth: 15.0,
              percent: percentage,
              animation: true,
              animationDuration: 1500,
              center: new Text(
                '${(percentage * 100).toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 20),
              ),
              footer: new Text(
                'Hasil voting',
                style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
              ),
              progressColor: Colors.indigo[400],
            ),
          ),
        ],
      );
    }
  }

  Widget resultLinear() {
    return ListView.builder(
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        final candidate = candidates[index];
        final name = candidate['name'];
        final percentage = double.parse(candidate['percentage']) / 100;

        return ListTile(
          leading: Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Text(
            '${(percentage * 100).toStringAsFixed(0)}%',
            style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
          ),
        );
      },
    );
  }
}
