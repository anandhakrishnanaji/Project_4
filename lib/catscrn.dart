import 'package:flutter/material.dart';
import './dummy_data.dart';
import './catitem.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        children: dummy_data.map((tx) {
          return Catitem(colord: tx.color, title: tx.title,id: tx.id,);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      ),
    );
  }
}
