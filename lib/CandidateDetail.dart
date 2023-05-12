import 'package:flutter/material.dart';
import 'candidate.dart';

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
        // Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Color(0xFFBA68C8),
        //         Color(0xff5E64FD),
        //       ],
        //       begin: FractionalOffset.bottomCenter,
        //       end: FractionalOffset.topCenter,
        //     ),
        //   ),
        // ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff5E64FD),
            title: Text(candidate.name),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              child: Column(children: [
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 5),
                //   child: Text(
                //     'Visi dan Misi',
                //     style: TextStyle(
                //       color: Colors.white.withOpacity(0.9),
                //       fontSize: 28,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 1,
                //     ),
                //   ),
                // ),
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
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(25),
                              //    color: Color(0xff5E64FD),
                              // ),
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
                                  child: Image.asset(
                                'assets/images/profile.png',
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
                       color: Color(0xff5E64FD),),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Visi dan Misi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                          ),
                        ),
                        
                        subtitle: Text(
                          candidate.visi,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
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