import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Model/Food.dart';

class FoodsController extends GetxController {
  final List<Food> foodList = [];
  final foodNameController = TextEditingController();
  final foodTypeController = TextEditingController();

  void clearTextInput() {
    foodNameController.clear();
    foodTypeController.clear();
  }

  onInit() {
    foodList.add(Food(name: 'banana', type: 'fruits'));
    foodList.add(Food(name: 'apples', type: 'fruits'));
    foodList.add(Food(name: 'melon', type: 'fruits'));
    super.onInit();
  }

  void addItem(Food item) {
    foodList.add(item);
    update();
  }
}
