import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static final routeName = '/mealdetailscrn';
  final togglefav;
  final isfav;
  MealDetail(this.togglefav, this.isfav);

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments;
    //void remove() => Navigator.of(context).pop(mealid);

    final Meal selecteddata =
        DUMMY_MEALS.firstWhere((meals) => meals.id == mealid);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(isfav(mealid) ? Icons.star : Icons.star_border),
          onPressed: () => togglefav(mealid),
        ),
        appBar: AppBar(
          title: Text('Meal Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*  Text(
                selecteddata.title,
                style: TextStyle(fontFamily: 'Roboto',fontSize: 26),
              ),*/
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(selecteddata.imageUrl))),
              Text(
                'Ingredients',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 26),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1)),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      //color: Colors.yellow,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          selecteddata.ingredients[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  },
                  itemCount: selecteddata.ingredients.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Steps',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 26),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white),
                margin: EdgeInsets.only(bottom: 10),
                height: 200,
                width: 300,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            selecteddata.steps[index],
                            textAlign: TextAlign.left,
                          ),
                          leading: CircleAvatar(
                            child: Text('$index.'),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: selecteddata.steps.length,
                ),
              )
            ],
          ),
        ));
  }
}
