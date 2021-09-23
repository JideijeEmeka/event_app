import 'package:event_app/customwidgets/widgets.dart';
import 'package:event_app/screens/drawer.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/services/auth.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  AuthMethods authMethods = new AuthMethods();

  signOut() {
    authMethods.signOut();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event App"),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Lists of available Events',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('With event name',
                    style: TextStyle(
                      fontSize: 17,
                    )),
                SizedBox(height: 20),
                events(context, "Wedding Ceremony of the Manager",
                    "event name: Wedding/Marriage"),
                SizedBox(height: 10),
                events(context, "Birthday Celebration of the Governor",
                    "event name: Birthday"),
                SizedBox(height: 10),
                events(context, "Interview with Dochase Executives",
                    "event name: Interview/Job"),
                SizedBox(height: 10),
                events(context, "Chelsea vs WestHam",
                    "event name: Football match"),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    signOut();
                  },
                  child: Text("Logout"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "email",
                              hintText: "enter user email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Approve User"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            textStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "email",
                              hintText: "enter user email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Deny User"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              textStyle: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
