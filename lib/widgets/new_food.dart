import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NewFood extends StatefulWidget {
  final Function submit;

  NewFood(this.submit);
  @override
  _NewFoodState createState() => _NewFoodState();
}

class _NewFoodState extends State<NewFood> {
  final _nameController = TextEditingController();

  final _gramsController = TextEditingController();

  final _caloriesController = TextEditingController();

  DateTime _selectedDate;

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitFood() {
    widget.submit(_nameController.text, double.parse(_gramsController.text),
        double.parse(_caloriesController.text), _selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Name"),
                  controller: _nameController,
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: "Grams",
                    ),
                    controller: _gramsController,
                    keyboardType: TextInputType.number),
                TextField(
                  decoration: InputDecoration(labelText: "Calories"),
                  controller: _caloriesController,
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectedDate == null
                            ? "No date chosen"
                            : DateFormat.yMd().format(_selectedDate))),
                    FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        "Choose date",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: RaisedButton(
                      onPressed: _submitFood,
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.button,
                      ),
                      color: Theme.of(context).primaryColor),
                )
              ]),
        ),
      ),
    );
  }
}
