import 'package:flutter/material.dart';
import 'candidate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5E64FD),
        title: Text('Vote'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 250),
        ),
        child: FutureBuilder<List<Candidate>>(
          future: fetchCandidates(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final candidates = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 20),
                itemCount: candidates.length,
                itemBuilder: (BuildContext context, int index) {
                  final candidate = candidates[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  child: Image.network(
                                    'https://voting.surabayawebtech.com/storage/image/${candidate.image}',
                                    width: 315, // Specify the desired width
                                    height: 200, // Specify the desired height
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff5E64FD),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      candidate.id,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Text(
                              candidate.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 112, 69, 198),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                width: double.infinity,
                                child: TextButton(
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
                                              child: const Text(
                                                "Batal",
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await voteCandidate(context,
                                                    int.parse(candidate.id));
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Vote",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 112, 69, 198),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    'Vote',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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




  Future<void> voteCandidate(BuildContext context, int candidateId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    http.Response userResponse = await http.get(
      Uri.parse('https://voting.surabayawebtech.com/api/auth/me'),
      headers: headers,
    );

    if (userResponse.statusCode == 200) {
      // Berhasil mendapatkan data pengguna
      var userData = json.decode(userResponse.body);
      int userId = userData['id'];

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      http.Response voteResponse = await http.post(
        Uri.parse('https://voting.surabayawebtech.com/api/auth/votes'),
        headers: headers,
        body: json.encode({
          'voter_id': userId.toString(),
          'candidate_id': candidateId.toString(),
        }),
      );

      var candidateData = json.decode(voteResponse.body);
      final message = candidateData['message'];
      if (message == 'Vote submitted successfully') {
        // Berhasil memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Successful"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Nama: ${userData['name']}"),
                  Text("Email: ${userData['email']}"),
                ],
              ),
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
      } else if (message == 'You have already voted') {
        // sudah memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text(candidateData['message']),
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
      } else if (message == 'Candidate not found') {
        // sudah memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text(candidateData['message']),
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
      } else if (message == 'Belum saatnya pemilihan dimulai.') {
        // sudah memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text(candidateData['message']),
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
      } else if (message == 'Maaf, waktu pemilihan sudah berakhir.') {
        // sudah memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text(candidateData['message']),
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
      } else {
        // Gagal memilih
        await showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text("Vote Failed"),
              content: Text(candidateData['message']),
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
