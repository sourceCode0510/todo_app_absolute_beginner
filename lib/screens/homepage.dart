import 'package:flutter/material.dart';
import '../models/db_model.dart';
import '../models/todo_model.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // we have to create our functions here, where the two widgets can communicate

  // create a database object so we can access database functions
  var db = DatabaseConnect();

  // function to add todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  // function to delete todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple todo app'),
      ),
      backgroundColor: const Color(0xFFF5EBFF),
      body: Column(
        children: [
          Todolist(insertFunction: addItem, deleteFunction: deleteItem),
          // we will add our widgets here.
          UserInput(insertFunction: addItem),
        ],
      ),
    );
  }
}
