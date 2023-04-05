import 'package:flutter/material.dart';
import 'candidate.dart';
import 'detail_candidate.dart';

class ListCandidateScreen extends StatelessWidget {
  const ListCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Candidates'),
        ),
        body: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            final candidate = candidates[index];
            return Column(
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8),
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
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
                const Divider(),
              ],
            );
          },
        ));
  }
}
