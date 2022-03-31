import 'package:event_app/screens/admin_reg.dart';
import 'package:event_app/screens/events_page.dart';
import 'package:event_app/services/auth.dart';
import 'package:event_app/services/database.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>(); 
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  signIn() {
    if (formKey.currentState!.validate()) {
      Map<String, String> userInfoMap = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      setState(() {
        isLoading = true;
      });

      authMethods
          .signInWithEmailandPassword(
              emailController.text, passwordController.text)
          .then((val) {
        databaseMethods.uploadUserInfo(userInfoMap);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => EventPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
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
                  Text('Signin In...',
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
        : Container(
            height: 350,
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
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                      borderRadius: BorderRadius.circular(10))),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                      borderRadius: BorderRadius.circular(10))),
                            )),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text("login"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminReg()));
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
