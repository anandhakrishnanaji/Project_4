import 'package:flutter/material.dart';
import 'package:project_4/models/meal.dart';
import '../widgets/mealitem.dart';

class Catmeals extends StatefulWidget {
  final List meall;
  Catmeals(this.meall);

  @override
  _CatmealsState createState() => _CatmealsState();
}

class _CatmealsState extends State<Catmeals> {
  var cattitle;
  List<Meal> editmeal;
  var isloaded = false;

  @override
  void didChangeDependencies() {
    if (!isloaded) {
      final route =
          ModalRoute.of(context).settings.arguments as Map<Object, Object>;
      cattitle = route['cattitle'];
      final catid = route['id'];
      editmeal = widget.meall.where((m) {
        return m.categories.contains(catid);
      }).toList();
      isloaded = true;
    }
    super.didChangeDependencies();
  }

  void remove(String meallid) {
    setState(() {
      editmeal.removeWhere((d) => d.id == meallid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(cattitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MaterialItem(
              id: editmeal[index].id,
              src: editmeal[index].imageUrl,
              affordability: editmeal[index].affordability,
              complexity: editmeal[index].complexity,
              duration: editmeal[index].duration,
              title: editmeal[index].title,
            );
          },
          itemCount: editmeal.length,
        ),
      ),
    );
  }
}
