import 'package:flutter/material.dart';
import 'candidate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailCandidateScreen extends StatelessWidget {
  const DetailCandidateScreen({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff5E64FD),
            title: Text('Candidate'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWitdh = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.50,
                              width: innerWitdh,
                              child: Column(children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  candidate.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    height: 3,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                  child: CachedNetworkImage(
                                imageUrl:
                                    'http://voting.surabayawebtech.com/storage/image/${candidate.image}',
                                width: innerHeight * 0.7,
                                fit: BoxFit.fitWidth,
                              )),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff5E64FD),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Visi dan Misi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          candidate.visi,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
