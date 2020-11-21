import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Views/HomePage.dart';
import 'package:flutter_app_test/Views/SecondPage.dart';
import 'package:flutter_app_test/Views/ThirdPage.dart';
import 'package:flutter_app_test/Views/FoodType.dart';
import 'package:firebase_core/firebase_core.dart';

class MainNav extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
            title: Text('Home Page'),
            onTap: () {
              Navigator.pop(context);
              Get.to(HomePage());
            }),
        ListTile(
            title: Text('Second Page'),
            onTap: () {
              Navigator.pop(context);
              Get.to(SecondPage());
            }),
        ListTile(
            title: Text('Third Page'),
            onTap: () {
              Navigator.pop(context);
              Get.to(ThirdPage());
            }),
        ListTile(
            title: Text('Food Type'),
            onTap: () {
              Navigator.pop(context);
              Get.to(FoodType());
            }),
      ]),
    );
  }
}