import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculator',
    theme: ThemeData(primarySwatch: Colors.red),
    home: Home(),
  ));
}
