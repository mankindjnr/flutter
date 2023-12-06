# USER INPUT

__main.dart__ calls the landing page

```dart
import 'package:flutter/material.dart';
import 'package:userinput/pages/todo_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDOPage(),
    );
  }
}
```

__todo_page.dart__ calls the todo page

The __TextField__ widget is used to get user input

```dart
import 'package:flutter/material.dart';

class ToDOPage extends StatefulWidget {
  const ToDOPage({ Key? key }) : super(key: key);
  @override
  _ToDOPageState createState() => _ToDOPageState();
}

class _ToDOPageState extends State<ToDOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: Center(
        child: TextField(),
      ),
    );
  }
}
```

Now we are going to use the TextEditingController to get access to the user input.

```dart
import 'package:flutter/material.dart';

class ToDOPage extends StatefulWidget {
  const ToDOPage({ Key? key }) : super(key: key);
  @override
  _ToDOPageState createState() => _ToDOPageState();
}

class _ToDOPageState extends State<ToDOPage> {

  TextEditingController _controller = TextEditingController();

  String greetingMessage = "";
  //greet user
  void greetUser(){
    String name = _controller.text;
    setState(() {
      greetingMessage = "Hello, ${name}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // greet user
              Text(greetingMessage),

              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name",
                ),
              ),
              ElevatedButton(
                onPressed: greetUser,
                child: Text("hit me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```