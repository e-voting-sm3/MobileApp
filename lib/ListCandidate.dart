import 'package:list_tile/constansts.dart';

import 'candidate.dart';
import 'package:flutter/material.dart';
import 'CandidateDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        title: Text('List Candidate'),
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
                    title: Text(
                      candidate.name,
                      style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      candidate.visi,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Color(0xDD696969)),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryLightColor,
                    ),
                    leading: Container(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          'http://voting.surabayawebtech.com/storage/image/${candidate.image}',
                        ),
                      ),
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
                    tileColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    selectedTileColor: Colors.white,
                    selected: true,
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
