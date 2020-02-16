import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/mealdetailscrn.dart';

class MaterialItem extends StatelessWidget {
  final id;
  final src;
  final duration;
  final affordability;
  final complexity;
  final title;

  MaterialItem({
    this.id,
    this.affordability,
    this.complexity,
    this.duration,
    this.src,
    this.title,
  });

  String get complexitytest {
    if (complexity == Complexity.Simple) return "Simple";
    if (complexity == Complexity.Hard)
      return "Hard";
    else
      return "Challenging";
  }

  String get afford {
    if (affordability == Affordability.Affordable) return "Affordable";
    if (affordability == Affordability.Luxurious)
      return "Luxurious";
    else
      return "Pricey";
  }

  void select(ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    src,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Raleway',
                        backgroundColor: Colors.black54),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration mins'),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexitytest),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(afford)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
