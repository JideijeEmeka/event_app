import 'package:event_app/screens/check_in_users.dart';
import 'package:event_app/screens/home.dart';
import 'package:flutter/material.dart';

customTextField(String labeltext, String hintText) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labeltext,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
  );
}

customButton(String text) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(text),
    style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  );
}

events(BuildContext context, String eventTitle, String eventName) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CheckedIn()));
    },
    child: Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 20,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 23,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eventTitle,
                  style: TextStyle(
                    fontSize: 17,
                  )),
              Text(eventName,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    ),
  );
}
