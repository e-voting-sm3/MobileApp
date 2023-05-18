import 'candidate.dart';
import 'package:flutter/material.dart';
import 'CandidateDetail.dart';

class ListCandidate extends StatefulWidget {
  const ListCandidate({Key? key}) : super(key: key);

  @override
  _ListCandidateState createState() => _ListCandidateState();
}

class _ListCandidateState extends State<ListCandidate> {
  late Future<List<Candidate>> _candidatesFuture;

  @override
  void initState() {
    super.initState();
    _candidatesFuture = fetchCandidates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xff5E64FD),
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(' Candidate'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Candidate>>(
        future: _candidatesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final candidates = snapshot.data!;
            return ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (BuildContext context, int index) {
                final candidate = candidates[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 45, 44, 44).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: ListTile(
                    title: Text(candidate.name),
                    subtitle: Text(
                      candidate.visi,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/${candidate.image}'),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailCandidateScreen(candidate: candidate),
                        ),
                      );
                    },
                    iconColor: Colors.black,
                    textColor: Colors.black,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
