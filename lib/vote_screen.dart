import 'package:flutter/material.dart';
import 'candidate.dart';

class VoteScreen extends StatelessWidget {
  final Candidate candidate;

  VoteScreen({required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/${candidate.image}'),
            ),
            SizedBox(height: 30.0),
            Text(
              candidate.name,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Logika untuk melakukan vote pada kandidat yang dipilih
              },
              child: Text('Vote'),
            ),
          ],
        ),
      ),
    );
  }
}



// class VoteScreen extends StatelessWidget {
//   final Candidate candidate;

//   VoteScreen({required this.candidate});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Vote Candidate'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 60.0,
//               backgroundImage: AssetImage('images/${candidate.image}'),
//             ),
//             SizedBox(height: 30.0),
//             Text(
//               candidate.name,
//               style: TextStyle(fontSize: 24.0),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               candidate.visi,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 30.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Logika untuk melakukan vote pada kandidat yang dipilih
//               },
//               child: Text('Vote'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

