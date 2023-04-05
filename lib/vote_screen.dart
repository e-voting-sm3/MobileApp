import 'package:flutter/material.dart';
import 'candidate.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vote'),
        ),
        body: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            final candidate = candidates[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(16.0)),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('images/${candidate.image}'),
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 30.0),
                Text(
                  candidate.name,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
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
              ],
            );
          },
        ));
  }
}
