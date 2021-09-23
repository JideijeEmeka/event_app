import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/screens/drawer.dart';
import 'package:event_app/screens/qr_code.dart';
import 'package:flutter/material.dart';

class CheckedIn extends StatefulWidget {
  const CheckedIn({Key? key}) : super(key: key);

  @override
  _CheckedInState createState() => _CheckedInState();
}

class _CheckedInState extends State<CheckedIn> {
  // getallUsers() async {
  //   final QuerySnapshot qSnap =
  //       await FirebaseFirestore.instance.collection("users").get();
  //   final int users = qSnap.docs.length;
  //   return users;
  // }

  // Future getCount() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .where('deleted', isEqualTo: false)
  //       .get()
  //       .then((value) {
  //     var count = 0;
  //     count = value.docs.length;
  //     return count;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check In Users"),
      ),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Total Registered Users',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Text("backend",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              SizedBox(
                height: 40,
              ),
              Text('Total Checked in Users',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Text('0',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QrCode()));
                },
                child: Text("Check In"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
