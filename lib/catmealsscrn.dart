import 'package:flutter/material.dart';

class Catmeals extends StatelessWidget {
  final cattitle;
  final catid;
  Catmeals(this.cattitle, this.catid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: Center(
        child: Text('Category Meals'),
      ),
    );
  }
}
