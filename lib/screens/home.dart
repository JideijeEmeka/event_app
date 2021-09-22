import 'package:event_app/screens/admin_login.dart';
import 'package:event_app/screens/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event App'),
      ),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text('Events Registration System',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text('With QR Code Generator and QR  Scanner'),
            SizedBox(
              height: 50,
            ),
            //ADMIN LOGIN
            AdminLogin(),
          ]),
        ),
      ),
    );
  }
}
