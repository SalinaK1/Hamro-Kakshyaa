import 'package:flutter/material.dart';

void main(){
  runApp(Notice());
}

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  List<int> notices = [];

  @override
  void initState() {
    for (int i=1; i<51; i++){
      notices.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Hamroo Kakshyaa",
      home: new Scaffold(
        backgroundColor: const Color(0xFFF6F0F0),
        appBar: new AppBar(
          title: new Text(
            'Notices', 
            style: TextStyle(color: Colors.black)
          ),
          backgroundColor: const Color(0xFF51C4D3),
        ),
        body: new ListView.builder(
          itemCount: notices.length,
          itemBuilder: (BuildContext contex, int index){
            return new Card(
              color: const Color(0xFFD8E3E7),
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child : new ListTile(
                leading: new Icon(
                  Icons.notifications_active,
                  color: const Color(0xFF132C33),
                  size: 30.0,
                ),
                title: new Text ('Notice $index'),
                subtitle: new Text('Details about the notice $index.'),
                // isThreeLine: true,
                trailing: new Icon(
                  Icons.arrow_right,
                  color: const Color(0xFF132C33),
                  size: 30.0,
                  semanticLabel: 'Know more about the notice.',
                  ), 
              )
            );
          })
      ),
    );
  }
}
