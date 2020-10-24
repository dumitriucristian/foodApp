import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Controllers/FoodsController.dart';

class SecondPage extends StatelessWidget {
  final FoodsController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            ctrl.clearTextInput();
          },
        ),
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
