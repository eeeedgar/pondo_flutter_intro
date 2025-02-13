import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final database = FirebaseDatabase.instance.ref();
final tasksRef = database.child('tasks');

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<String> _tasks = [];

  @override
  void initState() {
    super.initState();

    tasksRef.onValue.listen((DatabaseEvent event) {
      final data = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
      _tasks = data.entries.map((e) => e.value.toString()).toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_tasks[index]),
        ),
      ),
    );
  }
}
