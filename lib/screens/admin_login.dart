import 'package:event_app/customwidgets/widgets.dart';
import 'package:event_app/screens/admin_reg.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.blue),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Admin Login",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: customTextField("email", "your email")),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: customTextField("password", "your password")),
          SizedBox(
            height: 15,
          ),
          customButton("Login"),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AdminReg()));
            },
            child: Text(
              "Register",
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
