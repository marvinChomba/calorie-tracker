import 'package:flutter/material.dart';

import './models/food.dart';
import "./widgets/food_list.dart";
import "./widgets/new_food.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color primaryColor = Color.fromRGBO(254, 53, 98, 1);
  Color accentColor = Color.fromRGBO(80, 90, 91, 1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: accentColor,
          // fontFamily: 'Nunito Sans',
          textTheme: ThemeData.light().textTheme.copyWith(
              button: TextStyle(color: Colors.white),
              title: TextStyle(fontWeight: FontWeight.bold))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Food> _recentFoods = [
    Food(
        name: "Chicken Breast", calories: 567, grams: 40, date: DateTime.now()),
    Food(name: "Protein Shake", calories: 400, grams: 50, date: DateTime.now())
  ];

  void _addFood(name, grams, calories, date) {
    setState(() {
      _recentFoods
          .add(Food(calories: calories, date: date, grams: grams, name: name));
    });
  }

  void _startAddFood() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewFood(_addFood);
        });
  }

  void _deleteFood(name) {
    setState(() {
      _recentFoods.removeWhere((food) => food.name == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calorie Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _startAddFood,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[FoodList(_recentFoods, _deleteFood)],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAddFood,
        child: Icon(Icons.add),
      ),
    );
  }
}
