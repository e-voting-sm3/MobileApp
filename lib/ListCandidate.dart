import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'candidate.dart';
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
      backgroundColor: Color.fromARGB(255, 230, 230, 250),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF5E64FD),
        elevation: 0,
        toolbarHeight: 70,
        title: const Text('Candidates'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Candidate>>(
        future: _candidatesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final candidates = snapshot.data!;
            return Theme(
              data: Theme.of(context).copyWith(
                cardColor: Color(0xFF5E64FD),
              ),
              child: ListView.builder(
                itemCount: candidates.length,
                itemBuilder: (BuildContext context, int index) {
                  final candidate = candidates[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CandidateDetailScreen(candidate: candidate),
                      //   ),
                      // );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1.9,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://voting.surabayawebtech.com/storage/image/${candidate.image}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  candidate.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  candidate.visi,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailCandidateScreen(
                                            candidate: candidate,
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      'Detail',
                                      style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
