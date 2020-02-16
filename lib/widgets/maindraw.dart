import 'package:flutter/material.dart';
import '../screens/filterscrn.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(IconData icon, String text, Function selscrn) {
    return ListTile(
      onTap: selscrn,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.amber,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontSize: 33,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    color: Colors.red),
              )),
          buildTile(Icons.fastfood, 'Meals',
              () => Navigator.of(context).pushReplacementNamed('/')),
          buildTile(
              Icons.settings,
              'Filters',
              () =>
                  Navigator.of(context).pushReplacementNamed(Filters.routeName))
        ],
      ),
    );
  }
}
