import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(13.0),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Row(
            children: [
            //checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),

            //task name
            Text(
              taskName,
              style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              decoration: taskCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}