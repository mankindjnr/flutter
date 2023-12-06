import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [
  ];
  //reference the box
  final _todoBox = Hive.box('todoBox');

  // run this if its the first time the app is opened
  void createInitialData() {
    toDoList = [
      ["make tutorial", false],
      ["hit the gym", false],
      ["buy groceries", false],
    ];
  }

  // load dta from the databse
  void loadData() {
    toDoList = _todoBox.get('todos', defaultValue: toDoList);
  }


  // save data to the database
  void updateDatabase() {
    _todoBox.put('todos', toDoList);
  }
}