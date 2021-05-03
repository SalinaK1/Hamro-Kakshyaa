import 'package:flutter/material.dart';

class Time {
  int hour, min;

  Time({this.hour, this.min});
}

class Routine {
  String subj, type, place;
  Time t;

  Routine({this.subj, this.type, this.place, this.t});
}

Widget routineCardGenerator(lecture) {
  return Card(
    color: Color(0xffe1f6f7),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Code: ${lecture.subj}',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              Text('Time: ${lecture.t.hour}:${lecture.t.min}',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${lecture.type} class',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              Text('${lecture.place}',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ],
          )
        ],
      ),
    ),
  );
}

Widget routineBlock() {
  List<Routine> lectures = [
    Routine(
      subj: 'COMP 311',
      place: 'Block 9, Room 302',
      type: 'Physical',
      t: Time(hour: 9, min: 30),
    ),
    Routine(
      subj: 'MGTS 301',
      place: 'Meet: hty-asf-asd',
      type: 'Online',
      t: Time(hour: 13, min: 0),
    ),
    Routine(
      subj: 'COMP 303',
      place: 'Block 9, Room 404',
      type: 'Physical',
      t: Time(hour: 2, min: 45),
    ),
  ];

  return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Todays\' Routine',
                style: TextStyle(
                    color: Color(0xff126e82),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Divider(
            color: Color(0xff51C4D3),
            thickness: 3,
            indent: 100,
            endIndent: 100,
          ),
          Column(
              children: lectures
                  .map((lecture) => routineCardGenerator(lecture))
                  .toList())
        ],
      ));
}