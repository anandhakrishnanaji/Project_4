import 'package:flutter/material.dart';
import '../widgets/maindraw.dart';

class Filters extends StatefulWidget {
  static final routeName = '/filterscrn';
  final setfilt;
  final filters;
  Filters(this.filters, this.setfilt);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var isglutf = false;
  var islactf = false;
  var isveg = false;
  var isvega = false;
  @override
  initState() {
    isglutf = widget.filters['glut'];
    islactf = widget.filters['lact'];
    isveg = widget.filters['veg'];
    isvega = widget.filters['vega'];
    super.initState();
  }

  Widget buildtile(bool value, Function fun, Text title, Text descr) {
    return SwitchListTile(
      value: value,
      onChanged: fun,
      title: title,
      subtitle: descr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.setfilt({
                'glut': isglutf,
                'lact': islactf,
                'veg': isveg,
                'vega': isvega
              }),
            )
          ],
          title: Text('Filters'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                child: Text(
              'Adjust the filters',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildtile(isglutf, (dynew) {
                  setState(() {
                    isglutf = dynew;
                  });
                }, Text('Gluten Free'), Text('Only include gluten free meals')),
                buildtile(islactf, (dynew) {
                  setState(() {
                    islactf = dynew;
                  });
                }, Text('Lactose Free'),
                    Text('Only include lactose free meals')),
                buildtile(isveg, (dynew) {
                  setState(() {
                    isveg = dynew;
                  });
                }, Text('Vegetarian'), Text('Only include vegetarian meals')),
                buildtile(isvega, (dynew) {
                  setState(() {
                    isvega = dynew;
                  });
                }, Text('Vegan'), Text('Only include vegan meals')),
              ],
            )),
          ],
        ));
  }
}
