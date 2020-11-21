import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_test/Components/MainNav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodType extends StatelessWidget {
  final foodTypeController = TextEditingController();

  deleteFoodType(DocumentSnapshot foodType) {
    String id = foodType.id;
    FirebaseFirestore.instance
        .collection("FoodType")
        .doc(id)
        .delete()
        .then((_) {
      print('deleted');
    });
  }

  addFoodType(foodTypeController) {
    String foodType = foodTypeController.value.text;
    FirebaseFirestore.instance
        .collection('FoodType')
        .doc(foodType)
        .set({"type": foodType});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainNav(),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Food type'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("FoodType")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(2),
                        child: ListTile(
                            title: Text(
                              snapshot.data.documents[index]['type'],
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              focusColor: Colors.red,
                              iconSize: 30,
                              padding: EdgeInsets.all(15),
                              onPressed: () => deleteFoodType(
                                  snapshot.data.documents[index]),
                              icon: Icon(Icons.delete, color: Colors.black),
                            ),
                            tileColor: Colors.grey),
                      ),
                    );
                  }),
            ),
            Form(
              child: Column(children: [
                Text("Add some new food type"),
                Container(height: 30),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Food Type Name'),
                  controller: foodTypeController,
                ),
                Container(height: 30),
                ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () => addFoodType(foodTypeController)),
                Container(height: 30),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
