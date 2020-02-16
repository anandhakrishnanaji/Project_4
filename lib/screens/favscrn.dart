import 'package:flutter/material.dart';
import 'package:project_4/widgets/mealitem.dart';
import '../models/meal.dart';

class Favourites extends StatefulWidget {
  final List<Meal> fav;
  Favourites(this.fav);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return (widget.fav.length == 0)
        ? Center(child: Text('No favourites Added'))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MaterialItem(
                id: widget.fav[index].id,
                src: widget.fav[index].imageUrl,
                affordability: widget.fav[index].affordability,
                complexity: widget.fav[index].complexity,
                duration: widget.fav[index].duration,
                title: widget.fav[index].title,
              );
            },
            itemCount: widget.fav.length,
          );
  }
}
