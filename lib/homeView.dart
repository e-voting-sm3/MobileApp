import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
         padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04, vertical: size.height * 0.05),
                child: Column(
                  children: [
                    Row(
                    children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          color: Color(0xff7286D3),
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.08,
                          letterSpacing: 0.5),
                    ),
                    Spacer(),
                    Container(
                      height: size.width * 0.12,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  // height: size.height / 4,
                  // width: size.width / 1.2,
                  height: 300,
                  width: 500,
                  child:
                      Image.asset("assets/images/person1.png", fit: BoxFit.fitWidth),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/list_candidate');
                        },
                         style:ElevatedButton.styleFrom(
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
                                      child: Image.asset("assets/images/person2.png",
                                      width: 80,
                                      height: 50,

                                      ),
                                    ),
                                    SizedBox(width: 50,),
                                    Container(
                                      child: Text("Candidate",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 4,
                                        fontSize: 20
                                      ),
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
                          Navigator.pushNamed(context, '/vote');
                        },
                        style:ElevatedButton.styleFrom(
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
                                      child: Image.asset("assets/images/person3.png",
                                      width: 80,
                                      height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 70,),
                                    Container(
                                      child: Text("Vote",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 4,
                                        fontSize: 20
                                      ),),
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
                        style:ElevatedButton.styleFrom(
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
                                      child: Image.asset("assets/images/person5.png",
                                      width: 80,
                                      height: 50,
                                      ),
                                    ),
                                    SizedBox(width: 60,),
                                    Container(
                                      child: Text("Result",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        height: 4,
                                        fontSize: 20
                                      ),),
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

    );
  }
}