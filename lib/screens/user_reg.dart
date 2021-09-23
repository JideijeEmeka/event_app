import 'package:event_app/screens/drawer.dart';
import 'package:event_app/screens/home.dart';
import 'package:event_app/services/auth.dart';
import 'package:event_app/services/database.dart';
import 'package:event_app/services/google_auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class UserReg extends StatefulWidget {
  const UserReg({Key? key}) : super(key: key);

  @override
  _UserRegState createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  sendMail() async {
    final user = await GoogleAuthApi.signIn();

    if (user == null) return;
    String email = user.email;
    final auth = await user.authentication;
    final accessToken = auth.accessToken!;

    final smtpServer = gmailSaslXoauth2(email, accessToken);

    final message = Message()
      ..from = Address(email, "Jideije")
      ..recipients.add('lockeroom035@gmail.com')
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Mail using mailer package :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Write the content here</h1>\n<p>Hey! its easy use html tags for alignment</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  register() {
    if (formKey.currentState!.validate()) {
      Map<String, String> userInfoMap = {
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,
        'firstname': firstNameController.text,
        'lastname': lastNameController.text,
      };

      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      )
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
        title: Text("User Registration Form"),
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
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (val) {
                                return val!.isEmpty || val.length < 3
                                    ? 'Please provide a valid firstname'
                                    : null;
                              },
                              controller: firstNameController,
                              decoration: InputDecoration(
                                  labelText: "First Name",
                                  hintText: "enter your first name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                return val!.isEmpty || val.length < 3
                                    ? 'Please provide a valid lastname'
                                    : null;
                              },
                              controller: lastNameController,
                              decoration: InputDecoration(
                                  labelText: "Last Name",
                                  hintText: "enter your last name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                return val!.isEmpty || val.length < 11
                                    ? 'Please provide a valid phone number'
                                    : null;
                              },
                              controller: phoneController,
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "enter your phone number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val!)
                                    ? null
                                    : 'Please provide a valid email';
                              },
                              controller: emailController,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "enter your email address",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
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
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                register();
                                // sendMail();
                              },
                              child: Text("Register"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 15),
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
