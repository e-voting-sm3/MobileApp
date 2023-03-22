import 'package:evoting/done_tourism_list.dart';
import 'package:evoting/tourism_list.dart';
import 'package:flutter/material.dart';
import 'package:evoting/model/tourism_place.dart';

import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  // dummy data

  @override
  _MainScreenState createState() => _MainScreenState();

  // Widget listItem(TourismPlace place) {}
}

class _MainScreenState extends State<MainScreen> {
  final List<TourismPlace> doneTourismPlaceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DoneTourismList(
                      doneTourismPlaceList: doneTourismPlaceList);
                }),
              );
            },
          )
        ],
      ),
      body: TourismList(doneTourismPlaceList: doneTourismPlaceList),
    );
  }
}
