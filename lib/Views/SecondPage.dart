import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Controllers/FoodsController.dart';
import 'package:flutter_app_test/Components/MainNav.dart';

class SecondPage extends StatelessWidget {
  final FoodsController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainNav(),
      appBar: AppBar(
        /* leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            ctrl.clearTextInput();
          },
        ),
        */
        title: Text('Pentru mine'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<FoodsController>(
              builder: (_) => ListView.builder(
                itemCount: ctrl.foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(ctrl.foodList[index].name),
                    subtitle: Text(ctrl.foodList[index].type),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
