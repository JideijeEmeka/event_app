import 'package:event_app/screens/drawer.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event App"),
      ),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Lists of available Events',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
