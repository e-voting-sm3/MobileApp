import 'package:flutter/material.dart';
import 'candidate.dart';
import 'detail_candidate.dart';

class ListCandidateScreen extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate('1', 'Jokowi & Puan', 'candidate1.png',
        'Menciptakan kehidupan yang aman, tentram, adil, dan makmur untuk masyarakat sekitar sembari membangun lingkungan desa yang lebih tertata.'),
    Candidate('2', 'Prabowo & Megawati', 'candidate2.png',
        'Menciptakan Indonesia yang bebas dari narkoba dan menjauhkan generasi muda dari bahaya narkotika, zat aditif serta psikotropika.'),
    Candidate('3', 'Ganjar & Risma', 'candidate3.png',
        'Meningkatkan kinerja sumber daya manusia pada proses pengolahan untuk memelihara kualitas bahan baku'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Candidates'),
        ),
        body: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            final candidate = candidates[index];
            return Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${candidate.image}'),
                  ),
                  title: Text(candidate.name),
                  subtitle: Text(
                    candidate.visi,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text("0${candidate.id}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailCandidateScreen(candidate: candidate),
                      ),
                    );
                  },
                ),
                Divider(),
              ],
            );
          },
        ));
  }
}
