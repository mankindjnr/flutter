import 'package:flutter/material.dart';
import '../util/todo_tile.dart';
import '../util/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _todoBox = Hive.box("todoBox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if the app is opened for the first time, create initial data
    if (_todoBox.isEmpty) {
      db.createInitialData();
      db.updateDatabase();
    } else {
      // if not, load data from the database
      db.loadData();
    }

    super.initState();
  }
  // text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  //create new task

  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
    db.updateDatabase();
  }

  // delte task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}