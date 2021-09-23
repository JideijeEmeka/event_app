import 'package:event_app/screens/admin_login.dart';
import 'package:event_app/screens/drawer.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/services/auth.dart';
import 'package:event_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminReg extends StatefulWidget {
  const AdminReg({Key? key}) : super(key: key);

  @override
  _AdminRegState createState() => _AdminRegState();
}

class _AdminRegState extends State<AdminReg> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signUp() {
    if (formKey.currentState!.validate()) {
      Map<String, String> userInfoMap = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((val) {
        databaseMethods.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Registration"),
      ),
      drawer: MainDrawer(),
      body: isLoading
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Creating account...',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    CircularProgressIndicator(
                      color: Colors.pink,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Register as Admin",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val!)
                                      ? null
                                      : 'Please provide a valid email';
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: "email",
                                    hintText: "your email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: TextFormField(
                                obscureText: true,
                                validator: (val) {
                                  return val!.length > 5
                                      ? null
                                      : 'Please provide a password of 6+ characters';
                                },
                                controller: passwordController,
                                decoration: InputDecoration(
                                    labelText: "password",
                                    hintText: "your password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
    );
  }
}
