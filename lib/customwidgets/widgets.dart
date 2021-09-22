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
