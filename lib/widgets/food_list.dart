import "package:flutter/material.dart";
import "package:intl/intl.dart";

import '../models/food.dart';

class FoodList extends StatelessWidget {
  final List<Food> recentFoods;
  final Function delete;

  FoodList(this.recentFoods, this.delete);

  void _deleteFood(name) {
    delete(name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        itemCount: recentFoods.length,
        itemBuilder: (context, i) {
          return Card(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                child: FittedBox(
                    child: Text(recentFoods[i].calories.toStringAsFixed(0))),
              ),
              title: Text(recentFoods[i].name,
                  style: Theme.of(context).textTheme.title),
              subtitle: Text(DateFormat.yMMMd().format(recentFoods[i].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  _deleteFood(recentFoods[i].name);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
