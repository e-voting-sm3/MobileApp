import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 250), // Menambahkan background color
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(height: 100,),
                  Expanded(
                    child: Text(
                      "Home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff5E64FD),
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.08,
                          letterSpacing: 0.5),
                    ),
                  ),
                ],
              ),
             
              Container(
                // height: size.height / 4,
                // width: size.width / 1.2,
                height: 300,
                width: 500,
                child: Image.asset("assets/images/home2.png",
                    fit: BoxFit.fitWidth),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/list_candidate');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff5E64FD),
                        fixedSize: const Size(300, 80),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/person2.png",
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  child: Text(
                                    "Candidate",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/vote');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff5E64FD),
                        fixedSize: const Size(300, 80),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/person3.png",
                                    width: 81,
                                    height: 68,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  child: Text(
                                    "Vote",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 2,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/result');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff5E64FD),
                        fixedSize: const Size(300, 80),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/person5.png",
                                    width: 80,
                                    height: 75,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  child: Text(
                                    "Result",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
