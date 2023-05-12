import 'package:flutter/material.dart';
import 'candidate.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff5E64FD),
          title: const Text('Vote'),
        ),
        body: Container(
          
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff5E64FD),
                Colors.indigo.shade50,
              ],
            )
          ),
         child: ListView.builder( 
          padding: EdgeInsets.only(top: 20),
          itemCount: candidates.length,
          itemBuilder: (BuildContext context, int index) {
            final candidate = candidates[index];
            return Card (
              color: Colors.grey[100],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                 children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 15)),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/${candidate.image}'),
                  backgroundColor: Colors.black,

                ),
                const SizedBox(height: 18),
                Text(
                  candidate.name,
                  style: const TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    
                  ),
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
                  child: const Text('Vote') 
                ),
                SizedBox(height: 10,),
              ],
              ),
              );
          },
        )
        )
      );
  }
}