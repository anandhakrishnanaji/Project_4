import 'package:flutter/material.dart';

class Catitem extends StatelessWidget {
  final title;
  final id;
  final Color colord;
  Catitem({this.title, this.colord, this.id});

  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/catscrn', arguments: {'id': id, 'cattitle': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [colord.withOpacity(0.7), colord],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
