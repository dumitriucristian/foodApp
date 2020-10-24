import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Model/Food.dart';
import 'package:flutter_app_test/Controllers/FoodsController.dart';
import 'package:flutter_app_test/Views/SecondPage.dart';

class HomePage extends StatelessWidget {
  final FoodsController foodsController = Get.put(FoodsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your food'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: foodsController.foodNameController,
                decoration: InputDecoration(hintText: "Food Name"),
              ),
              TextFormField(
                autofocus: false,
                controller: foodsController.foodTypeController,
                decoration: InputDecoration(hintText: "Food Type"),
              ),
              ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  foodsController.foodList.add(Food(
                      name: "${foodsController.foodNameController.text}",
                      type: "${foodsController.foodTypeController.text}"));
                  Get.to(SecondPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
