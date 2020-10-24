import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class Food {
  Food({this.name, this.type});
  String name, type;

  @override
  String toString() => '${this.name} is a ${this.type}';
}

class FoodsController extends GetxController {
  final List<Food> foodList = [];
  int nrOfFoods = 0;

  onInit() {
    foodList.add(Food(name: 'banana', type: 'fruits'));
    foodList.add(Food(name: 'apples', type: 'fruits'));
    foodList.add(Food(name: 'melon', type: 'fruits'));
    super.onInit();
  }

  void addItem(Food item) {
    foodList.add(item);
    nrOfFoods = foodList.length;
    update();
  }
}

class HomePage extends StatelessWidget {
  final FoodsController foodsController = Get.put(FoodsController());
  final _foodNameController = TextEditingController();
  final _foodTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(foodsController.foodList);
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _foodNameController,
                decoration: InputDecoration(hintText: "Food Name"),
              ),
              TextFormField(
                controller: _foodTypeController,
                decoration: InputDecoration(hintText: "Food Type"),
              ),
              ElevatedButton(
                child: Text("test"),
                onPressed: () {
                  foodsController.foodList.add(Food(
                      name: "${_foodNameController.text}",
                      type: "${_foodTypeController.text}"));
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

class SecondPage extends StatelessWidget {
  final FoodsController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<FoodsController>(
              builder: (_) => ListView.builder(
                itemCount: ctrl.foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text(ctrl.foodList[index].name));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
