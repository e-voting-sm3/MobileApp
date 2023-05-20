import 'package:flutter/material.dart';
import 'candidate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5E64FD),
        title: const Text('Vote'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff5E64FD),
              Colors.indigo.shade50,
            ],
          ),
        ),
        child: FutureBuilder<List<Candidate>>(
          future: fetchCandidates(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final candidates = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: candidates.length,
                itemBuilder: (BuildContext context, int index) {
                  final candidate = candidates[index];
                  return Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('images/${candidate.image}'),
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          candidate.id,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          candidate.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () async {
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Konfirmasi"),
                                  content: Text(
                                      "Apakah Anda yakin ingin memilih ${candidate.name}?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        voteCandidate(context, candidate.id); //
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Vote"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Vote'),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Failed to fetch candidates'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> voteCandidate(BuildContext context, String candidateId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var userResponse = await http.get(
      Uri.parse('http://localhost:8000/api/auth/me'),
      headers: headers,
    );

    if (userResponse.statusCode == 200) {
      final userData = jsonDecode(userResponse.body);
      final dataUser = userData['data'];
      String userId = dataUser['id'];


      var response = await http.post(
        Uri.parse('http://localhost:8000/api/auth/votes'),
        body: jsonEncode({
          'voter_id': userId,
          'candidate_id': candidateId,
        }),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Berhasil memilih
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Successful"),
              content: const Text("Anda telah berhasil memilih kandidat."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    // Lakukan navigasi ke layar lain jika diperlukan
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        // Gagal memilih
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text("Gagal memilih. Silakan coba lagi."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Gagal mendapatkan data pengguna
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text("Vote Failed"),
            content: Text("Gagal memilih. Silakan coba lagi."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
