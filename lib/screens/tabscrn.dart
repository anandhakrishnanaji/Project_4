import 'package:flutter/material.dart';

import './catscrn.dart';
import './favscrn.dart';
import '../widgets/maindraw.dart';

class Tabscreen extends StatefulWidget {
  final fav;

  Tabscreen(this.fav);
  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> {
  var selectind = 0;
  var k;
  void select(int index) {
    setState(() {
      selectind = index;
    });
  }

  @override
  void initState() {
    k = [
      {'page': Category(), 'title': 'Categories'},
      {'page': Favourites(widget.fav), 'title': 'Favourites'}
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectind,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        onTap: select,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourites'),
              backgroundColor: Theme.of(context).primaryColor)
        ],
      ),
      body: k[selectind]['page'],
      appBar: AppBar(
        title: Text(k[selectind]['title']),
      ),
    );
  }
}
