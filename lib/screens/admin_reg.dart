import 'package:event_app/screens/drawer.dart';
import 'package:flutter/material.dart';

class AdminReg extends StatefulWidget {
  const AdminReg({Key? key}) : super(key: key);

  @override
  _AdminRegState createState() => _AdminRegState();
}

class _AdminRegState extends State<AdminReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Registration"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Register as Admin",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "email",
                      hintText: "your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "password",
                      hintText: "your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Register"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
