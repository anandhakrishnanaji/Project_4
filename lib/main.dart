import 'package:flutter/material.dart';
import 'screens/filterscrn.dart';
import 'screens/tabscrn.dart';
import 'screens/catmealsscrn.dart';
import 'screens/mealdetailscrn.dart';
import './models/meal.dart';
import './models/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map filter = {'glut': false, 'lact': false, 'veg': false, 'vega': false};

  List<Meal> meall = DUMMY_MEALS;

  List<Meal> fav = [];

  void togglefav(String mealid) {
    int indexwhere = fav.indexWhere((meal) => (meal.id == mealid));
    if (indexwhere >= 0)
      setState(() {
        fav.removeAt(indexwhere);
      });
    else
      setState(() {
        fav.add(DUMMY_MEALS.firstWhere((meal) => (mealid == meal.id)));
      });
  }

  void setfilters(Map<String, bool> fil) {
    setState(() {
      filter = fil;
      // print(filter['veg']);

      meall = DUMMY_MEALS.where((mealss) {
        if (filter['glut'] == true && !mealss.isGlutenFree) return false;
        if (filter['lact'] == true && !mealss.isLactoseFree) return false;
        if (filter['veg'] == true && !mealss.isVegetarian) return false;
        if (filter['vega'] == true && !mealss.isVegan) return false;
        return true;
      }).toList();
    });
  }

  bool isfav(String mealid) {
    return fav.any((meal) => (meal.id == mealid));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.yellowAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(
                20,
                51,
                51,
                1,
              ),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(
                20,
                51,
                51,
                1,
              ),
            ),
            title: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        '/': (_) => Tabscreen(fav),
        '/catscrn': (_) => Catmeals(meall),
        MealDetail.routeName: (_) => MealDetail(togglefav, isfav),
        Filters.routeName: (_) => Filters(filter, setfilters)
      },
      title: 'Food',
    );
  }
}

/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: null,
    );
  }
}*/
