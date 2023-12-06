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