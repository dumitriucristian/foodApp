import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test',
      home: HomePage(),
    );
  }
}
