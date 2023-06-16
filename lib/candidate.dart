import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Candidate {
  final String id;
  final String name;
  final String image;
  final String visi;
  final String misi;

  Candidate(this.id, this.name, this.image, this.visi, this.misi);
}

Future<List<Candidate>> fetchCandidates() async {
  // Mendapatkan token dari Shared Preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  // Membuat header dengan menyertakan token
  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  final response = await http.get(
    Uri.parse('https://voting.surabayawebtech.com/api/auth/candidates'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final jsonCandidates = jsonData['data'] as List<dynamic>;

    return jsonCandidates
        .map((jsonCandidate) => Candidate(
              jsonCandidate['id'].toString(),
              jsonCandidate['name'] as String,
              jsonCandidate['photo'] as String,
              jsonCandidate['visi'] as String,
              jsonCandidate['misi'] as String,
            ))
        .toList();
  } else {
    throw Exception('Failed to fetch candidates');
  }
}
